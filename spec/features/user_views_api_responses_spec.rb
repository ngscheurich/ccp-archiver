require "rails_helper"

feature "User views API responses" do
  scenario "views all API responses" do
    api_response = create(:api_response)

    visit api_responses_path

    expect(page).to have_css(
      ".api-response__request-initiated",
      api_response.request_initiated
    )
  end

  scenario "views single API response" do
    api_response = create(:api_response)

    visit api_response_path(api_response.id)

    expect(page).to have_css(
      ".api-response__request-initiated",
      api_response.request_initiated
    )
  end
end
