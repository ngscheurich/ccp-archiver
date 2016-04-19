class SearchesController < ApplicationController
  def show
    @stories = Story.where(cms_id: params[:cms_id])
  end
end
