class AddCodeAndMessageToApiResponses < ActiveRecord::Migration
  def change
    add_column :api_responses, :code, :integer
    add_column :api_responses, :message, :string
  end
end
