require "rails_helper"

feature "User visits dashboard" do
  scenario "sees the heading" do
    user = create(:user)

    visit dashboard_path(as: user)

    expect(page).to have_css ".panel__title", "Stories Imported"
  end
end
