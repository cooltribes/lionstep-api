require 'rails_helper'

describe V1::Users::AcademicExperiencesController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:experience){ AcademicExperience.make!(user: current_user) }
  let(:academic_diploma){ AcademicDiploma.create!(name: "Diploma", locale: "es") }
  let(:academic_area){ AcademicArea.create!(name: "Area", locale: "es") }

  let(:valid_params) do
    { degree: "Engineer", institution: "UNET", start_date: "15-02-2010", end_date: "17-06-2015",
      actual_grade: "PhD", country_code: "US", city: "San Francisco",
      academic_diploma_id: academic_diploma.id, academic_area_id: academic_area.id }
  end

  let(:invalid_params) do
    { degree: "", institution: "UNET", start_date: "15-02-2010", end_date: "17-06-2015",
      actual_grade: "PhD", country_code: "US", city: "San Francisco" }
  end

  describe "POST users/:id/experiences" do
    context "With valid params" do
      it "Should create a new experience for current user" do
        post user_academic_experiences_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json_attribute("degree")).to eq("Engineer")
        last_experience = current_user.academic_experiences.last
        expect(last_experience.academic_diploma).to eq(academic_diploma)
        expect(last_experience.academic_area).to eq(academic_area)
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        post user_academic_experiences_path(current_user), invalid_params, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json["degree"]).to eq([I18n.t("errors.messages.blank")])
      end
    end
  end

  describe "PUT users/:id/experiences/:id" do
    it "Should update the experience" do
      put user_academic_experience_path(current_user, experience), { degree: "Biologist"}, request_headers_for(current_user)

      expect(response.status).to eq(200)
      expect(json_attribute("degree")).to eq("Biologist")
    end
  end

  describe "DELETE users/:id/experiences/:id" do
    it "Should delete a experience of current user" do
      experience
      expect {
        delete user_academic_experience_path(current_user, experience), {}, request_headers_for(current_user)
      }.to change(current_user.academic_experiences, :count).by(-1)
    end
  end

end
