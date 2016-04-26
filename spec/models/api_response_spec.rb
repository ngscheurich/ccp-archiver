require "rails_helper"

describe ApiResponse do
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
