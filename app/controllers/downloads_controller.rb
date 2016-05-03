class DownloadsController < ApplicationController
  before_action :render_nothing

  def start
  end

  private

  def render_nothing
    render nothing: true
  end
end
