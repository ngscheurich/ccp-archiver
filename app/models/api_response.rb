# coding: utf-8
class ApiResponse < ActiveRecord::Base
  def self.last_cms_id
    ApiResponse.last.cms_ids.last
  end

  def status
    "#{code} #{message}"
  end

  def server_response_time
  end

  def cms_ids
    extract("cms_ids", [])
  end

  def stories_retrieved
    cms_ids.length
  end

  def cms_id_range
    head = extract("cms_id_start")
    last = extract("cms_id_end")
    head == last ? head : "#{head}–#{last}"
  end

  def extract(key, default = "")
    hash = JSON.parse(body)
    hash.key?(key) ? hash[key] : default
  end
end
