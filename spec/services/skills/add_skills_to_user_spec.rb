require 'rails_helper'

RSpec.describe Skills::AddSkillsToUser, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let(:skill_levels_collection) do
    [
      { name: " Ruby", level: 5 },
      { name: Skill.make!.name, level: 2 }
    ]
  end

  describe "#call" do
    it "should add skill_level to user and create a skill if not exists" do
      service = Skills::AddSkillsToUser.new(current_user, skill_levels_collection, "en")
      expect{
        service.call
      }.to change(Skill, :count).by(1)
      expect(current_user.skills.count).to eq(2)
    end
  end

end