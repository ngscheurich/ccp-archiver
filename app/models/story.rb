class Story < ActiveRecord::Base
  default_scope { order(created_at: "DESC") }
  validates :cms_id, presence: true, uniqueness: true
  has_and_belongs_to_many :photos
  belongs_to :api_response

  DEFAULT_SECTION = "baton_rouge/news".freeze

  module States
    NEW = 1
    PROCESSING = 2
    DONE = 3
    ERROR = 4
  end

  def section
    mapping = CategorySectionMapping.where(
      category: category,
      subcategory: subcategory
    ).first || NoCategorySectionMapping.new

    mapping.section
  end

  def nitf
    nitf = Nitf::Story.new(self)
    puts nitf.builder.to_xml
  end

  def nitf_publish_date
    date = publish_date || NoPublishDate.new
    zoned = date.in_time_zone("Central Time (US & Canada)")
    zoned.strftime("%Y%m%dT%H%M%S")
  end
  
  def published_at
    date = publish_date || NoPublishDate.new
    zoned = date.in_time_zone("Central Time (US & Canada)")
    zoned.strftime("%Y-%m-%d %l:%M %p")
  end

  class NoPublishDate
    def in_time_zone(zone)
      self
    end

    def strftime(str)
      "-"
    end
  end
end
