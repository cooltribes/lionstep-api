require 'rails_helper'

describe V1::Users::AlbumsController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:album){ Album.make!(owner: current_user, albumable: current_user) }

  let(:valid_params) do
    { name: "New Album" }
  end

  let(:invalid_params) do
    { name: "" }
  end

  describe "GET users/:id/albums" do
    before do
      3.times do
        Album.make!(owner: current_user, albumable: current_user)
      end
    end
    it "should return a paginate collection of records" do
      get user_albums_path(current_user), {page: 1, per: 2}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json).to have_key("links")
      expect(json_meta["current_page"]).to eq(1)
      expect(json_meta["total_count"]).to eq(6) # 3 + default + cover + avatar
    end
  end

  describe "POST users/:id/albums" do
    context "With valid params" do
      it "Should create a new album for current user" do
        post user_albums_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json_attribute("name")).to eq("New Album")
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        post user_albums_path(current_user), invalid_params, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json["name"]).to eq(["can't be blank"])
      end
    end
  end

  describe "PUT users/:id/albums/:id" do
    it "Should update the album" do
      put user_album_path(current_user, album), { name: "fcoarmandomendoza@gmail.com"}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json_attribute("name")).to eq("fcoarmandomendoza@gmail.com")
    end
  end

  describe "DELETE users/:id/albums/:id" do
    it "Should delete a album of current user" do
      album
      expect {
        delete user_album_path(current_user, album), {}, request_headers_for(current_user)
      }.to change(current_user.albums, :count).by(-1)
    end
  end
end
