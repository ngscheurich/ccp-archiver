class AddHeadersToApiResponses < ActiveRecord::Migration
  def change
    add_column :api_responses, :headers, :text
  end
end
