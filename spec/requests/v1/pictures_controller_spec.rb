require 'rails_helper'

describe V1::PicturesController do
  let!(:current_user){ User.make!(:confirmed) }

  let(:valid_params) do
    { title: "New Picture" }
  end


  describe "POST pictures" do
    context "With valid params" do
      it "Should create a new picture for current user without album" do
        post pictures_path, valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json_attribute("title")).to eq("New Picture")
      end
    end
  end

end
