require 'rails_helper'

describe V1::SectorsController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /sectors" do
    it "return all sectors" do
      2.times {|x| Sector.create!(name: "Sector-#{x}-es", locale: "es")}
      2.times {|x| Sector.create!(name: "Sector-#{x}-en", locale: "en")}
      I18n.locale = "es"
      get "/sectors", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("Sector-0-es")
    end
  end

end
