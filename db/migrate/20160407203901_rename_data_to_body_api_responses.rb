class RenameDataToBodyApiResponses < ActiveRecord::Migration
  def change
    rename_column :api_responses, :data, :body
  end
end
