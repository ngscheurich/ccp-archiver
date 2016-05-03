# coding: utf-8
class ApiResponse < ActiveRecord::Base
  default_scope { order(created_at: "DESC") }
  has_many :stories

  def status
    "#{code} #{message}"
  end

  def server_response_time
  end

  def cms_ids
    extract("cms_ids", [0])
  end

  def stories_retrieved
    cms_ids.length
  end

  def cms_id_range
    head = cms_ids.first
    last = cms_ids.last
    head == last ? head : "#{head}–#{last}"
  end

  def extract(key, default = "")
    hash = JSON.parse(body)
    hash.key?(key) ? hash[key] : default
  rescue
    default
  end

  def initiated_at_formatted
    date = initiated_at.in_time_zone("Central Time (US & Canada)")
    date.strftime("%Y-%m-%d %H:%M:%S")
  end

  def elapsed_seconds
    "#{(elapsed_time / 1000).round(2)} s"
  end
end
