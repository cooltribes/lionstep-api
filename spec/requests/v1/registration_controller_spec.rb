require 'rails_helper'

describe V1::RegistrationController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET registration" do
    it "Should return the registration step of user" do
      current_user.update(registration_step: "1")
      get "/registration", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json["step"]).to eq("1")
    end
  end

  describe "PUT tests" do
    it "Should update the registration step of current_user" do
      put "/registration", { step: "3" }, request_headers_for(current_user)
      expect(response.status).to eq(200)
      current_user.reload
      expect(current_user.registration_step).to eq("3")
      expect(json["step"]).to eq("3")
    end
  end

end
