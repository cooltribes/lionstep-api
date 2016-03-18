require 'rails_helper'

describe V1::Albums::PicturesController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:country){ Country.make! }

  describe "GET /countries" do
    it "return all countries" do
      get "/countries", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first).to have_key("name")
    end
  end

  describe "GET /countries/:country_code/cities" do
    it "return all cities of country" do
      get "/countries/#{country.cc_iso}/cities", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json).to eq([{"cc_iso"=>country.cc_iso, "name"=>country.cities.first.name}])
    end
  end
end
