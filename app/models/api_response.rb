# coding: utf-8
class ApiResponse < ActiveRecord::Base
  def time_elapsed
    (request_completed - request_initiated) * 1000
  end

  def server_status
    "#{response_code} #{HttpStatus.message(response_code)}"
  end

  def cms_ids
    if cms_id_start == cms_id_end
      cms_id_start
    else
      "#{cms_id_start}–#{cms_id_end}"
    end
  end
end
