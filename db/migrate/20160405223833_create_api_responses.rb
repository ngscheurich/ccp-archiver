class CreateApiResponses < ActiveRecord::Migration
  def change
    create_table :api_responses do |t|
      t.datetime :request_initiated
      t.datetime :request_completed
      t.integer :response_code
      t.float :server_response_time
      t.integer :cms_id_start
      t.integer :cms_id_end
      t.integer :stories_retrieved
      t.text :response_data

      t.timestamps null: false
    end
  end
end
