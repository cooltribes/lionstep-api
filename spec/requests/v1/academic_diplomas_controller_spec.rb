require 'rails_helper'

describe V1::AcademicDiplomasController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /academic_diplomas" do
    it "return all academic areas filter by locale" do
      2.times {|x| AcademicDiploma.create!(name: "Diploma-#{x}-en", locale: "en")}
      2.times {|x| AcademicDiploma.create!(name: "Diploma-#{x}-es", locale: "es")}
      I18n.locale = "es"
      get "/academic_diplomas", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("Diploma-0-es")
    end
  end

end
