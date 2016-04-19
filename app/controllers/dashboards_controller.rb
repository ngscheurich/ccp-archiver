class DashboardsController < ApplicationController
  def show
    @api_responses = ApiResponse.all
    @stories = Story.last(5)
  end
end
