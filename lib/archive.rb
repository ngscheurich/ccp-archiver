require "thor"
require "zip"

class Archive < Thor
  option :output, type: :string, aliases: "-o", default: ENV["HOME"] + "/archive.zip",
         desc: "Archive file to create"

  option :from, type: :string, aliases: "-f", default: "2010-01-01",
         desc: "Date archiving should begin"

  option :to, type: :string, aliases: "-t", default: "2016-12-31",
         desc: "Date archiving should end"

  option :"exclude-nulls", type: :boolean, aliases: "-e", default: true,
         desc: "Exclude stories with null headlines and/or publish dates"

  desc "create [OPTIONS]", "Download stories as NITF XML"
  def create
    stories = Story.where(conditions)

    file = options[:output]
    FileUtils.touch(file)

    outro(build_zip(file, stories))
  end

  private

  def conditions
    ary = [
      "date(publish_date) >= '#{options[:from]}'",
      "date(publish_date) <= '#{options[:to]}'"
    ]

    if options[:"exclude-nulls"]
      ary << "headline IS NOT NULL"
      ary << "publish_date IS NOT NULL"
    end

    ary.join(" AND ")
  end

  def build_zip(file, stories)
    start_time = Time.now
    Zip::OutputStream.open(file) do |zos|
      stories.each_with_index do |story, i|
        print "Processing #{file} (#{i + 1}/#{stories.count})...\r"
        zos.put_next_entry "article-#{story.cms_id}.xml"
        zos.puts Nitf::Story.new(story).xml
      end
    end
    end_time = Time.now

    ((end_time - start_time) / 60).round
  end

  def outro(min)
    unit = min > 1 ? "minutes" : "minute"
    puts "\nCompleted in #{min} #{unit}."
    puts "Have a great day."
  end
end
