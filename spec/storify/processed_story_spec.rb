require "rails_helper"

describe Storify::ProcessedStory do
  describe "#build" do
    it "builds the story correctly" do
      story = Story.create(story_attrs.merge(state: Story::States::DONE))
      proc_story = Storify::ProcessedStory.new(story_attrs).story

      story_attributes = attributes(story)
      proc_story_attributes = attributes(proc_story)

      expect(proc_story_attributes).to eq(story_attributes)
    end

    private

    def story_attrs
      {
        "cms_id" => "12345",
        "url" => "http://example.com/articles/1",
        "publish_date" => "2016-04-12",
        "time_updated" => "2015-04-12 11:17:23",
        "headline" => "NITF Test",
        "subhead" => "Web Subhead",
        "byline" => "Nicholas Scheurich",
        "body" => "<p>...</p>",
        "infobox" => "<ul>...</ul>",
        "keywords" => "keyword, another-keyword",
        "category" => "Baker",
        "subcategory" => "Education"
      }
    end

    def attributes(obj)
      reject_attrs = ["id", "created_at", "updated_at"]
      obj.attributes.reject { |k| reject_attrs.include?(k) }
    end
  end
end
