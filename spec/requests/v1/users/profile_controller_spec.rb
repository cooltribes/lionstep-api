require 'rails_helper'

describe V1::Users::ProfilesController do
  let!(:current_user){ User.make!(:confirmed, profile: nil) }

  let(:valid_params) do
    { first_name: "Armando", last_name: "Mendoza", born_date: "21-08-1980",
      country_code: "VE", city: "San Cristobal" }
  end

  let(:invalid_params) do
    { first_name: "", last_name: "Mendoza", born_date: "21-08-1980",
      country_code: "VE", city: "San Cristobal" }
  end

  describe 'PUT /profiles' do
    context "With valid params" do
      it "Should update the profile of current user" do
        expect(current_user.profile.first_name).to be_nil

        put user_profile_path(current_user), valid_params, request_headers_for(current_user)

        expect(response.status).to eq(200)
        expect(json["first_name"]).to eq("Armando")
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        put user_profile_path(current_user), invalid_params, request_headers_for(current_user)

        expect(response.status).to eq(422)
        expect(json["first_name"]).to eq(["can't be blank"])
      end
    end
  end

end
