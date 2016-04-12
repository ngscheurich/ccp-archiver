class ChangeStateTypeOnStories < ActiveRecord::Migration
  def up
    remove_column :stories, :state
    add_column :stories, :state, :integer
  end

  def down
    remove_column :stories, :state
    add_column :stories, :state, :boolean
  end
end
