require 'rails_helper'

describe "Admin Auth Controllers" do

  let!(:current_admin){ Admin.make!(:confirmed) }

  describe "POST /auth_admin/sign_in" do

    it "login the admin and return the admin info" do
      params = {email: current_admin.email, password: current_admin.password}
      post "/auth_admin/sign_in", params
      expect(response.status).to eq(200)
      expect(response.headers).to have_key("access-token")
      expect(json["data"]["email"]).to eq(current_admin.email)
    end

  end

end
