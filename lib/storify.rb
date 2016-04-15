module Storify
  class Stories
    attr_reader :api_response
    attr_reader :stories

    def initialize(api_response)
      @api_response = api_response
      @stories = JSON.parse(api_response.body)["stories"]
      process_stories
    end

    def process_stories
      @stories.each { |s| ProcessedStory.new(@api_response.id, s) }
    end
  end

  class ProcessedStory
    attr_reader :api_story
    attr_reader :story

    def initialize(api_response_id, api_story)
      @api_response_id = api_response_id
      @api_story = api_story
      @story = Story.new
      @story.state = Story::States::NEW
      build
      save
    end

    def build
      @story.state = Story::States::PROCESSING
      @story.cms_id = @api_story["cms_id"]
      @story.url = @api_story["url"]
      @story.publish_date = @api_story["publish_date"]
      @story.time_updated = @api_story["time_updated"]
      @story.headline = @api_story["headline"]
      @story.subhead = @api_story["subhead"]
      @story.byline = @api_story["byline"]
      @story.body = @api_story["body"]
      @story.infobox = @api_story["infobox"]
      @story.location = @api_story["location"]
      @story.keywords = @api_story["keywords"]
      @story.category = @api_story["category"]
      @story.subcategory = @api_story["subcategory"]
      @story.api_response_id = @api_response_id
      story_photos unless @api_story["photos"].nil?
    end

    def story_photos
      @api_story["photos"].each do |story_photo|
        existing_photo = Photo.where(photo_id: story_photo["photo_id"]).first
        photo = existing_photo || new_photo(story_photo)
        @story.photos << photo
      end
    end

    def new_photo(args)
      photo = Photo.new
      photo.photo_id = args["photo_id"]
      photo.byline = args["byline"]
      photo.credit = args["credit"]
      photo.caption = args["caption"]
      photo.source = args["source"]
      photo.save!
      return photo
    rescue ActiveRecord::RecordInvalid => invalid
      Rails.logger.error("Couldn't save Photo: #{invalid.record.errors}")
    end

    def save
      @story.state = Story::States::DONE
      @story.save!
    rescue ActiveRecord::RecordInvalid => invalid
      invalid.record.state = Story::States::ERROR
      Rails.logger.error("Couldn't save Story: #{invalid.record.errors}")
    end
  end
end
