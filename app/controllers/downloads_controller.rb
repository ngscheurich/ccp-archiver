require "zip"

class DownloadsController < ApplicationController
  before_action :render_nothing
  before_action :require_login
  before_action :set_stories, only: :start

  def start
    # buffer = Zip::OutputStream.write_buffer do |zos|
    #   @stories.each do |story|
    #     zos.put_next_entry "article-#{story.cms_id}.xml"
    #     zos.puts Nitf::Story.new(story).xml
    #   end
    # end

    # send_zip_file(buffer.string.force_encoding("binary"))
  end

  private

  def render_nothing
    render nothing: true
  end

  def set_stories
    @stories = Story.all
  end

  def send_zip_file(data)
    send_data(
      data,
      type: "application/zip",
      disposition: "attachment",
      filename: "advocate-nitf-#{Time.now.to_i}.zip"
    )
  end
end
