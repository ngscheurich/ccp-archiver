require "zip"

namespace :dti do
  desc "Get new story data from DTI web API"
  task stories: :environment do
    NUM_STORIES = 500
    last_cms_id = Story.first.nil? ? 1 : Story.first.cms_id + 1
    api_request = ApiRequest.new(last_cms_id, NUM_STORIES)
    Storify::Stories.new(api_request.api_response)
    puts "#{Time.now.in_time_zone('Central Time (US & Canada)')}: Requested #{NUM_STORIES} storie(s) starting with CMS ID #{last_cms_id}."
  end
end

namespace :archive do
  desc "Download stories as NITF XML"
  task :download do
    zip_file = "#{ENV['TO']}/ccp-archive-#{Time.now.strftime('%s')}.zip"
    story_count = Story.count

    FileUtils.touch(zip_file)

    start_time = Time.now
    Zip::OutputStream.open(zip_file) do |zos|
      Story.all.each_with_index do |story, i|
        print "Processing #{zip_file} (#{i + 1}/#{story_count})...\r"
        zos.put_next_entry "article-#{story.cms_id}.xml"
        zos.puts Nitf::Story.new(story).xml
      end
    end
    end_time = Time.now

    puts "\nCompleted in #{((end_time - start_time) / 60).round} minutes."
    puts "Have a great day."
  end
end
