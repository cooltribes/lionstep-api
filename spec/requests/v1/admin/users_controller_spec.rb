require 'rails_helper'

describe V1::Admin::UsersController do
  let!(:current_user){ User.make!(:confirmed) }
  let!(:admin){ Admin.make!(:confirmed) }

  describe "GET /admin/users" do
    it "return all users if user login as admin" do
      get admin_users_path, {}, request_admin_headers_for(admin)
      expect(response.status).to eq(200)
      # expect(json).to eq("")
    end
  end

end
