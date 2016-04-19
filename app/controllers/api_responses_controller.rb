class ApiResponsesController < ApplicationController
  before_action :require_login

  def index
    @api_responses = ApiResponse.paginate(page: params[:page], per_page: 25)
  end

  def show
    @api_response = ApiResponse.find(params[:id])
  end
end
