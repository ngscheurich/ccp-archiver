class AddCategoryFieldsToStories < ActiveRecord::Migration
  def change
    add_column :stories, :category, :string
    add_column :stories, :subcategory, :string
  end
end
