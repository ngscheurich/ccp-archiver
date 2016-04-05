class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :cms_id
      t.text :data

      t.timestamps null: false
    end
  end
end
