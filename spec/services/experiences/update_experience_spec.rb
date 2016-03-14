require 'rails_helper'

RSpec.describe Experiences::UpdateExperience, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let(:experience){ ProfessionalExperience.make! }
  let(:experience_params) do
    {
      position: "Programmer",
      skills: ["Ruby", " Rails"]
    }
  end

  describe "#call" do
    it "should update an experience and its skills" do
      service = Experiences::UpdateExperience.new(current_user, experience, experience_params)
      service.call
      expect(service.experience.position).to eq("Programmer")
      expect(service.experience.skills.last.name).to eq("Rails")
    end
  end

end