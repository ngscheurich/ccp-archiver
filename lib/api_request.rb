require "benchmark"

class ApiRequest
  attr_reader :request_initiated
  attr_reader :request_completed
  attr_reader :response_code
  attr_reader :response_body
  attr_reader :api_response

  def initialize(start_id = 1, num_stories = 1)
    @api_response = ApiResponse.new
    setup(start_id, num_stories)
  end

  def save_api_response
    build_api_response

    if @api_response.save
      Rails.logger.info("Saved ApiResponse: #{api_response.id}")
      return true
    else
      Rails.logger.error("Couldn't save ApiResponse: #{api_response.attributes.inspect}")
      return false
    end
  end

  private

  def setup(start_id, num_stories)
    dti = Dti.new(start_id, num_stories)

    @request_initiated = Time.now
    response = dti.stories
    @request_completed = Time.now

    @response_code = response.code
    @response_body = response.body
  end

  def build_api_response
    data = parsed_response

    @api_response.request_initiated = @request_initiated
    @api_response.request_completed = @request_completed
    @api_response.response_code = @response_code
    @api_response.server_response_time = data["server_response_time"]
    @api_response.stories_retrieved = data["cms_ids"].length
    @api_response.cms_id_start = data["cms_ids"].first
    @api_response.cms_id_end = data["cms_ids"].last
    @api_response.response_data = response_body
  end

  def parsed_response
    JSON.parse(@response_body)
  end
end
