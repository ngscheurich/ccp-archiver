module Storify
  class Stories
    attr_reader :stories

    def initialize(api_response)
      @stories = JSON.parse(api_response.body)["stories"]
      process_stories
    end

    def process_stories
      @stories.each { |s| ProcessedStory.new(s) }
    end
  end

  class ProcessedStory
    attr_reader :api_story
    attr_reader :story

    def initialize(api_story)
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
      @story.redirect_url = @api_story["redirect_url"]
      @story.publish_date = @api_story["publish_date"]
      @story.time_updated = @api_story["time_updated"]
      @story.headline = @api_story["headline"]
      @story.subhead = @api_story["subhead"]
      @story.byline = @api_story["byline"]
      @story.digest = @api_story["digest"]
      @story.body = @api_story["body"]
      @story.html_content = @api_story["html_content"]
      @story.infobox = @api_story["infobox"]
      @story.location = @api_story["location"]
      @story.video_provider = @api_story["video_provider"]
      @story.video_id = @api_story["video_id"]
      @story.promo_text = @api_story["promo_text"]
      # @story.keywords = @api_story["keywords"]
      # @story.html_content_two = @api_story["html_content_two"]
      # @story.pull_quote = @api_story["pull_quote"]
      # @story.suppress_comments = @api_story["suppress_comments"]
      # @story.suppress_ads = @api_story["suppress_ads"]
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
