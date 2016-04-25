class RemoveQueryFromApiResponses < ActiveRecord::Migration
  def change
    remove_column :api_responses, :query
  end
end
