require 'rails_helper'

describe "Auth Controllers" do

  let!(:current_user){ User.make!(:confirmed) }

  describe "POST /auth" do
    context "valid params" do
      let(:params){ { email: "test@upsidecorp.ch", password: "a1234568", password_confirmation: "a1234568",
        confirm_success_url: "http://localhost:3000/" } }
      let(:request) { post "/auth", params }

      it "register an user and return the info" do
        request
        expect(response.status).to eq(200)
        expect(json).to_not have_key("errors")
        expect(json["data"]["attributes"]["email"]).to eq("test@upsidecorp.ch")
      end

      it "send a confirmation mail" do
        expect { request }.to change(ActionMailer::Base.deliveries,:count).by(1)
      end
    end

    context "invalid params" do
      it "register an user and return the info" do
        params = { email: "test@upsidecorp.ch", password: "a12345", password_confirmation: "a12345z",
          confirm_success_url: "http://localhost:3000/" }
        post "/auth", params
        expect(response.status).to eq(403)
        expect(json).to have_key("errors")
      end
    end
  end


  describe "POST /auth/sign_in" do

    it "login the user and return the user info" do
      params = {email: current_user.email, password: current_user.password}
      post "/auth/sign_in", params
      expect(response.status).to eq(200)
      expect(json["data"]["attributes"]["email"]).to eq(current_user.email)
    end

  end


  describe "POST /auth/provider" do

    it "login the user with provider params and return the user info" do
      provider = current_user.oauth_providers.create!(uid: "TOKENTOKEN", provider: "linkedin")
      params = {uid: provider.uid, provider: provider.provider}
      post "/auth/provider", params
      expect(response.status).to eq(200)
      expect(json["data"]["attributes"]["email"]).to eq(current_user.email)
    end

  end

end
