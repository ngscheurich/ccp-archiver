require "benchmark"

class ApiRequest
  attr_reader :api_response

  def initialize(start_id = 1, num_stories = 1)
    dti = Dti.new(start_id, num_stories)

    @time_start = Time.now
    @response = dti.stories
    @time_finish = Time.now

    @api_response = create_api_response
    log_results(@api_response.save)
  end

  private

  def create_api_response
    @api_response = ApiResponse.new(
      initiated_at: @time_start,
      elapsed_time: (@time_finish - @time_start) * 1000,
      code: @response.code,
      message: @response.message,
      headers: @response.headers.to_json,
      body: @response.to_json
    )
  end

  def log_results(saved)
    selected_attrs = %w(id code message initiated_at elapsed_time)
    attrs = @api_response.attributes.select { |k| selected_attrs.include?(k) }

    if saved
      Rails.logger.info("Saved ApiResponse: #{attrs}")
    else
      Rails.logger.error("Couldn't save ApiResponse: #{attrs}")
    end
  end
end
