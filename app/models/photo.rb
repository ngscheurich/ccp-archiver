class Photo < ActiveRecord::Base
  validates :photo_id, uniqueness: true
  has_and_belongs_to_many :stories
end
