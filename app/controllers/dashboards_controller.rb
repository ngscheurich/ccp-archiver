class DashboardsController < ApplicationController
  def show
    @api_responses = ApiResponse.all
    @stories = Story.take(5)
  end
end
