class ApiResponsesController < ApplicationController
  before_action :require_login

  def index
    @api_responses = ApiResponse.all
  end

  def show
    @api_response = ApiResponse.find(params[:id])
  end
end
