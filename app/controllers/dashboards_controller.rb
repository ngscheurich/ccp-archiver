class DashboardsController < ApplicationController
  def show
    @api_responses = ApiResponse.all
  end
end
