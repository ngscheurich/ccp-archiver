class AddInitiatedAtToApiResponses < ActiveRecord::Migration
  def change
    add_column :api_responses, :initiated_at, :datetime
  end
end
