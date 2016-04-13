require "rails_helper"

describe Story do
  describe "#category_section" do
    it "should return the correct section" do
      SeedCategorySectionMappings.seed
      story = Story.create(category: "Baker", subcategory: "Education")

      expect(story.section).to eq("baton_rouge/news/communities/baker")
    end

    it "should return the default section if no mapping is found" do
      story = Story.create(category: "Foo", subcategory: "Bar")

      expect(story.section).to eq(Story::DEFAULT_SECTION)
    end
  end
end
