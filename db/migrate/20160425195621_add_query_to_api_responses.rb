class AddQueryToApiResponses < ActiveRecord::Migration
  def change
    add_column :api_responses, :query, :string
  end
end
