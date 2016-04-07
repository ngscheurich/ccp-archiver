# coding: utf-8
class ApiResponse < ActiveRecord::Base
  def self.last_cms_id
    ApiResponse.last.cms_ids.last
  end

  def time_elapsed
    (request_completed - request_initiated) * 1000
  end

  def server_status
    "#{response_code} #{HttpStatus.message(response_code)}"
  end

  def cms_ids
    JSON.parse(response_data)["cms_ids"]
  end

  def cms_id_range
    if cms_id_start == cms_id_end
      cms_id_start
    else
      "#{cms_id_start}–#{cms_id_end}"
    end
  end
end
