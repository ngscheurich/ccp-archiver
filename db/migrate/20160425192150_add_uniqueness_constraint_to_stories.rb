class AddUniquenessConstraintToStories < ActiveRecord::Migration
  def change
    change_column :stories, :cms_id, :integer, unique: true
  end
end
