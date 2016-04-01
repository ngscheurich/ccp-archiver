class Dti
  include HTTParty
  base_uri "theadvocate.com"

  def initialize(start_id = 1, num_stories = 1)
    @options = { query: { start_id: start_id, num_stories: num_stories } }
  end

  def stories
    self.class.get("/api/stories/nitf", @options)
  end
end
