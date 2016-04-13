class Story < ActiveRecord::Base
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
end
