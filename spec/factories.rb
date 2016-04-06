FactoryGirl.define do
  factory :api_response do
    request_initiated "2016-04-05 17:40:44"
    request_completed "2016-04-05 17:40:44"
    response_code 1
    server_response_time 1.5
    cms_id_start 1
    cms_id_end 1
    stories_retrieved 1
    response_data "MyText"
  end
  factory :story do
    cms_id 1
    data '{"foo":"bar"}'
  end
end
