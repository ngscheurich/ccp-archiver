require "rails_helper"

feature "User visits dashboard" do
  scenario "sees the heading" do
    visit dashboard_path

    expect(page).to have_css ".page-title", "Dashboard"
  end
end
