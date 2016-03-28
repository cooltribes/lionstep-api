require 'rails_helper'

describe V1::AcademicAreasController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /academic_areas" do
    it "return all academic areas filter by locale" do
      2.times {|x| AcademicArea.create!(name: "Area-#{x}-en", locale: "en")}
      2.times {|x| AcademicArea.create!(name: "Area-#{x}-es", locale: "es")}
      I18n.locale = "es"
      get "/academic_areas", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("Area-0-es")
    end
  end

end
