require "rails_helper"

feature "External request" do
  it "queries the DTI stories web API" do
    uri = URI("http://theadvocate.com/api/stories/nitf")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
