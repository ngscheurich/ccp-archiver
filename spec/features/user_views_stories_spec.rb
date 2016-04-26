require "rails_helper"

feature "User views stories" do
  scenario "views all stories" do
    user = create(:user)
    story = create(:story)

    visit stories_path(as: user)

    expect(page).to have_css ".story__cms-id", story.cms_id
  end
end
