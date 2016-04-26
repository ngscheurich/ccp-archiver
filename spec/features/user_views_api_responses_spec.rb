require "rails_helper"

feature "User views API responses" do
  scenario "views all API responses" do
    user = create(:user)
    api_response = create(:api_response)

    visit api_responses_path(as: user)

    expect(page).to have_css(
      ".api-response__initiated-at",
      api_response.initiated_at
    )
  end
end
