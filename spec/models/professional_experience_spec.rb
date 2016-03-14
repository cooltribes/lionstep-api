require 'rails_helper'

RSpec.describe ProfessionalExperience, type: :model do
  describe "Relations" do
    it "is a small spec to test relation with skills" do
      skill = Skill.make!
      experience = ProfessionalExperience.make!
      expect {
        experience.skills << skill
      }.to change(experience.skills, :count).by(1)
    end
  end
end
