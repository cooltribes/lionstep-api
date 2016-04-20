require 'rails_helper'

describe V1::ResponsibilitiesController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /responsibilities" do
    it "return all responsibilities levels" do
      2.times {|x| ResponsibilityLevel.create!(name: "Responsibility-#{x}-es", locale: "es")}
      2.times {|x| ResponsibilityLevel.create!(name: "Responsibility-#{x}-en", locale: "en")}
      I18n.locale = "es"
      get "/responsibilities", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("Responsibility-0-es")
    end
  end

end
