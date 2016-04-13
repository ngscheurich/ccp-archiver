require "rails_helper"

describe ApiResponse do
  describe ".last_cms_id" do
    it "returns the last cms_id" do
      create(:api_response, body: { cms_ids: [1] }.to_json)
      create(:api_response, body: { cms_ids: [2] }.to_json)
      create(:api_response, body: { cms_ids: [3] }.to_json)

      expect(ApiResponse.last_cms_id).to eq(3)
    end

    it "returns 1 if there are no ApiResponses" do
      expect(ApiResponse.last_cms_id).to eq(1)
    end
  end

  describe "#cms_ids" do
    it "returns the correct cms_ids" do
      api_response = create(
        :api_response,
        body: { cms_ids: [1, 2, 3] }.to_json
      )

      expect(api_response.cms_ids).to eq([1, 2, 3])
    end
  end
end
