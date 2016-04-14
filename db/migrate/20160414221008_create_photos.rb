class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :photo_id
      t.string :byline
      t.string :credit
      t.text :caption
      t.string :source

      t.timestamps null: false
    end
  end
end
