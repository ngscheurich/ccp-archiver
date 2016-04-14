class AssociatePhotosAndStories < ActiveRecord::Migration
  def change
    create_table :photos_stories, id: false do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :story, index: true
    end
  end
end
