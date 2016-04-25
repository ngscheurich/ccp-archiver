class DownloadsController < ApplicationController
  before_action :render_nothing
  before_action :require_login

  def start
    archive = Archive.last
    send_zip_file(archive.payload)
  end

  private

  def render_nothing
    render nothing: true
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
