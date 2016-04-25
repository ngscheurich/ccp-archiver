class AddIndividualQueryParamsToApiResponses < ActiveRecord::Migration
  def change
    add_column :api_responses, :start_id, :integer
    add_column :api_responses, :num_stories, :integer
  end
end
