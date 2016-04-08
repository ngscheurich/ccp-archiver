FactoryGirl.define do
  factory :api_response do
    initiated_at "2016-04-05 17:40:44"
    elapsed_time 536.21
    code 200
    message "OK"
    headers ""
    body '{"foo":"bar"}'
  end
end
