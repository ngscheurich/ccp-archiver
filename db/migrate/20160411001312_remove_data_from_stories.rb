class RemoveDataFromStories < ActiveRecord::Migration
  def up
    remove_column :stories, :data
  end

  def down
    add_column :stories, :data, :text
  end
end
