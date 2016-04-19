class SearchesController < ApplicationController
  before_action :require_login

  def show
    @stories = Story.where(cms_id: params[:cms_id])
  end
end
