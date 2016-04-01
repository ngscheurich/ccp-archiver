require "rails_helper"

describe Dti do
  describe "#stories" do
    it "returns valid JSON" do
      dti = Dti.new

      expect(valid_json?(dti.stories)).to be true
    end
  end
end
