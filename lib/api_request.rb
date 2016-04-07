require "benchmark"

module ApiRequest
  def self.dti(start_id = 1, num_stories = 1)
    dti = Dti.new(start_id, num_stories)

    time_start = Time.now
    data = dti.stories
    time_finish = Time.now
    initiated_at = time_start
    elapsed_time = (time_finish - time_start) * 1000

    create_api_response(initiated_at, elapsed_time, data)
  end

  private_class_method def self.create_api_response(initiated_at, elapsed_time, data)
    api_response = ApiResponse.new(
      initiated_at: initiated_at,
      elapsed_time: elapsed_time,
      data: data
    )

    if api_response.save
      Rails.logger.info("Saved ApiResponse: #{api_response.id}")
    else
      Rails.logger.error("Couldn't save ApiResponse: #{api_response.attributes.inspect}")
    end
  end
end
