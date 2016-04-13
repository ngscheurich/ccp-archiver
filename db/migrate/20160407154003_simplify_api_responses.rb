class SimplifyApiResponses < ActiveRecord::Migration
  def change
    remove_column :api_responses, :request_initiated
    remove_column :api_responses, :request_completed
    remove_column :api_responses, :response_code
    remove_column :api_responses, :server_response_time
    remove_column :api_responses, :cms_id_start
    remove_column :api_responses, :cms_id_end
    remove_column :api_responses, :stories_retrieved
    remove_column :api_responses, :response_data

    add_column :api_responses, :elapsed_time, :float
    add_column :api_responses, :data, :text
  end
end
