require 'rails_helper'

describe V1::Users::ExtraActivitiesController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:extra_activity){ ExtraActivity.create!(name: 'Run') }
  let(:valid_params) do
    { extra_activities:
      [
        { name: " Jump!", level: 5 },
        { name: " Run fast ", level: 2 }
      ]
    }
  end

  describe 'POST /extra_activities' do
    context "With valid params" do
      it "Should add the extra_activities to current user" do
        post user_extra_activities_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json["data"][0]["attributes"]["name"]).to eq("Jump!")
        expect(json["data"][1]["attributes"]["name"]).to eq("Run fast")
      end
    end

    context "With invalid params" do
      pending
    end
  end

  describe "DELETE /extra_activities/:id" do
    before { current_user.extra_activities << extra_activity }
    it "Should delete a extra_activities from current user" do
      expect {
        delete user_extra_activity_path(current_user, extra_activity), {}, request_headers_for(current_user)
      }.to change(current_user.extra_activities, :count).by(-1)
      expect(ExtraActivity.count).to eq(1)
    end
  end
end
