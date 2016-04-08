require "benchmark"

module ApiRequest
  def self.dti(start_id = 1, num_stories = 1)
    dti = Dti.new(start_id, num_stories)

    time_start = Time.now
    response = dti.stories
    time_finish = Time.now

    create_api_response(
      initiated_at: time_start,
      elapsed_time: (time_finish - time_start) * 1000,
      code: response.code,
      message: response.message,
      headers: response.headers.to_json,
      body: response.to_json
    )
  end

  private_class_method def self.create_api_response(args)
    api_response = ApiResponse.new(
      initiated_at: args[:initiated_at],
      elapsed_time: args[:elapsed_time],
      code: args[:code],
      message: args[:message],
      headers: args[:headers],
      body: args[:body]
    )

    if api_response.save
      Rails.logger.info("Saved ApiResponse: #{log_attrs(api_response)}")
    else
      Rails.logger.error("Couldn't save ApiResponse: #{log_attrs(api_response)}")
    end
  end

  private_class_method def self.log_attrs(api_response)
    api_response.attributes.slice("id", "code", "message", "initiated_at", "elapsed_time")
  end
end
