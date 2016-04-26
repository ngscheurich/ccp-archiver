namespace :dti do
  desc "Get new story data from DTI web API"
  task stories: :environment do
    NUM_STORIES = 500
    last_cms_id = Story.first.nil? ? 1 : Story.first.cms_id + 1
    api_request = ApiRequest.new(last_cms_id, NUM_STORIES)
    Storify::Stories.new(api_request.api_response)
    puts "#{Time.now.in_time_zone('Central Time (US & Canada)')}: Requested #{NUM_STORIES} storie(s) starting with CMS ID #{last_cms_id}."
  end
end

namespace :nitf do
  desc "Create new NITF archive string"
  task archive: :environment do
    buffer = Archive.buffer
    archive = Archive.last || NoArchive.new
    archive.payload = buffer
  end
end
