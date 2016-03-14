require 'rails_helper'

describe V1::Albums::PicturesController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:album){ Album.make!(owner: current_user, albumable: current_user) }
  let(:picture){ Picture.make!(owner: current_user, album: album) }

  let(:valid_params) do
    { title: "New Picture" }
  end

  let(:invalid_params) do
    { title: "" }
  end

  describe "GET album/:id/pictures" do
    before do
      3.times do
        Picture.make!(owner: current_user, album: album)
      end
    end
    it "should return a paginate collection of records" do
      get album_pictures_path(album), {page: 1, per: 2}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json).to have_key("links")
      expect(json_meta["current_page"]).to eq(1)
      expect(json_meta["total_count"]).to eq(3) # 3 + default + cover + avatar
    end
  end

  describe "POST album/:id/pictures" do
    context "With valid params" do
      it "Should create a new picture in album" do
        post album_pictures_path(album), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json_attribute("title")).to eq("New Picture")
      end
    end

    # context "With invalid params" do
    #   it "Should return a json with errors" do
    #     post album_pictures_path(album), invalid_params, request_headers_for(current_user)
    #     expect(response.status).to eq(422)
    #     expect(json["name"]).to eq(["can't be blank"])
    #   end
    # end
  end

  describe "PUT album/:id/pictures/:id" do
    it "Should update the picture" do
      put album_picture_path(album, picture), { title: "fcoarmandomendoza@gmail.com"}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json_attribute("title")).to eq("fcoarmandomendoza@gmail.com")
    end
  end

  describe "DELETE album/:id/pictures/:id" do
    it "Should delete a picture of album" do
      album
      picture
      expect {
        delete album_picture_path(album, picture), {}, request_headers_for(current_user)
      }.to change(current_user.pictures, :count).by(-1)
    end
  end
end
