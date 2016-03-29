require 'rails_helper'

describe V1::AcademicDegreesController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /academic_degrees" do
    it "return all academic degrees filtered by locale" do
      2.times {|x| AcademicDegree.create!(name: "Degree-#{x}-en", locale: "en")}
      2.times {|x| AcademicDegree.create!(name: "Degree-#{x}-es", locale: "es")}
      I18n.locale = "es"
      get "/academic_degrees", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("Degree-0-es")
    end
  end

end
