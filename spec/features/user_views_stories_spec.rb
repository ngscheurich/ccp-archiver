require "rails_helper"

feature "User views stories" do
  scenario "views all stories" do
    story = create(:story)

    visit stories_path

    expect(page).to have_css ".story__cms-id", story.cms_id
  end

  scenario "views single story" do
    story = create(:story)

    visit story_path(story.id)

    expect(page).to have_css ".story__cms-id", story.cms_id
  end
end
