require "rails_helper"

feature "User views API responses" do
  scenario "views all API responses" do
    api_response = create(:api_response)

    visit api_responses_path

    expect(page).to have_css(
      ".api-response__initiated-at",
      api_response.initiated_at
    )
  end

  scenario "views single API response" do
    api_response = create(:api_response)

    visit api_response_path(api_response.id)

    expect(page).to have_css(
      ".api-response__initiated-at",
      api_response.initiated_at
    )
  end
end
