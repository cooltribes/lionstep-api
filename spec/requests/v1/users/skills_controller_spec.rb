require 'rails_helper'

describe V1::Users::SkillsController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:skill){ Skill.make! }
  let(:valid_params) do
    { skills:
      [
        { name: " Ruby", level: 5 },
        { name: " PHP ", level: 2 }
      ]
    }
  end

  describe 'POST /skills' do
    context "With valid params" do
      it "Should add the skills to current user" do
        post user_skills_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json["data"][0]["attributes"]["name"]).to eq("Ruby")
        expect(json["data"][1]["attributes"]["name"]).to eq("PHP")
      end
    end

    context "With invalid params" do
      pending
    end
  end

  describe "DELETE /skills/:id" do
    before { current_user.skills << skill }
    it "Should delete a skills from current user" do
      expect {
        delete user_skill_path(current_user, skill), {}, request_headers_for(current_user)
      }.to change(current_user.skills, :count).by(-1)
      expect(Skill.count).to eq(1)
    end
  end
end
