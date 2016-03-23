require 'rails_helper'

describe V1::Users::ProfessionalExperiencesController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:experience){ ProfessionalExperience.make!(user: current_user) }
  let(:sector){ Sector.make! }

  let(:valid_params) do
    { position: "Developer", organization: "Google", start_date: "15-02-2010", end_date: "17-06-2012",
      country_code: "US", city: "San Francisco", current: false, sector_id: sector.id, skills: ["Rails","PHP"] }
  end

  let(:invalid_params) do
    { position: "", organization: "Google", start_date: "15-02-2010", end_date: "17-06-2012",
      country_code: "US", city: "San Francisco", current: false, sector_id: sector.id }
  end

  describe "POST /experiences" do
    context "With valid params" do
      it "Should create a new experience for current user" do
        post user_professional_experiences_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json_attribute("position")).to eq("Developer")
        expect(ProfessionalExperience.last.skills.count).to eq(2)
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        post user_professional_experiences_path(current_user), invalid_params, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json["position"]).to eq([I18n.t("errors.messages.blank")])
      end
    end
  end

  describe "PUT /experiences/:id" do
    it "Should update the experience" do
      put user_professional_experience_path(current_user, experience), { position: "Firefighter"}, request_headers_for(current_user)

      expect(response.status).to eq(200)
      expect(json_attribute("position")).to eq("Firefighter")
    end
  end

  describe "DELETE /experiences/:id" do
    it "Should delete a experience of current user" do
      experience
      expect {
        delete user_professional_experience_path(current_user, experience), {}, request_headers_for(current_user)
      }.to change(current_user.professional_experiences, :count).by(-1)
    end
  end

end
