require "zip"

class Archive < ActiveRecord::Base
  def self.buffer
    buffer = Zip::OutputStream.write_buffer do |zos|
      Story.all.each do |story|
        zos.put_next_entry "article-#{story.cms_id}.xml"
        zos.puts Nitf::Story.new(story).xml
      end
    end

    buffer.string.force_encoding("binary")
  end
end

class NoArchive
  def payload=(binary)
    Archive.create(payload: binary)
  end
end
