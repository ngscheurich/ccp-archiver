namespace :dti do
  desc "Get new story data from DTI web API"
  task stories: :environment do
    NUM_STORIES = 10
    last_cms_id = ApiResponse.last_cms_id
    api_request = ApiRequest.new(last_cms_id, NUM_STORIES)
    Storify::Stories.new(api_request.api_response)
  end
end
