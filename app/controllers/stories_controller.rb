class StoriesController < ApplicationController
  before_action :require_login

  def index
    @stories = Story.paginate(page: params[:page], per_page: 25)
  end

  def show
    @story = Story.find(params[:id])
  end
end
