class AssociateApiResponsesAndStories < ActiveRecord::Migration
  def change
    add_column :stories, :api_response_id, :integer
    add_index :stories, :api_response_id
  end
end
