require 'rails_helper'

describe V1::Admin::UsersController do
  let!(:current_user){ User.make!(:confirmed) }
  let!(:admin){ Admin.make!(:confirmed) }

  describe "GET /admin/users" do
    it "return all users if user login as admin" do
      get admin_users_path, {}, request_admin_headers_for(admin)
      expect(response.status).to eq(200)
      expect(json["data"].count).to eq(1)
      # expect(json).to eq("")
    end
  end

  describe "GET /admin/users/:id" do
    it "return all the info of the user" do
      get admin_user_path(current_user), {}, request_admin_headers_for(admin)
      expect(response.status).to eq(200)
      expect(json["data"]["attributes"]["email"]).to eq(current_user.email)
      # expect(json).to eq("")
    end
  end
end
