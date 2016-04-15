class StoriesController < ApplicationController
  def index
    @stories = Story.paginate(page: params[:page], per_page: 25)
  end

  def show
    @story = Story.find(params[:id])
  end
end
