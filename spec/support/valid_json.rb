def valid_json?(json)
  JSON.parse(json)
  true
rescue
  return false
end
