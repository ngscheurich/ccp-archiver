class ApiResponsesController < ApplicationController
  def index
    @api_responses = ApiResponse.all
  end

  def show
    @api_response = ApiResponse.find(params[:id])
  end
end
