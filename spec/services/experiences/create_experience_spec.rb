require 'rails_helper'

RSpec.describe Experiences::CreateExperience, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let(:experience_params) do
    {
      position: "Programmer",
      organization: "Cooltribes",
      start_date: "25-02-2014",
      end_date: "",
      current: true,
      country_code: Country.make!.cc_iso,
      city: "San Cristobal",
      sector_id: Sector.make!.id
    }
  end

  describe "#call" do
    it "should create an experience to user" do
      service = Experiences::CreateExperience.new(current_user, experience_params, type: "professional")
      expect{
        service.call
      }.to change(current_user.professional_experiences, :count).by(1)
    end

    it "should create and add skills to experience if skill param is given" do
      experience_params.merge!(skills: ["Ruby", "PHP", "Rails"])
      service = Experiences::CreateExperience.new(current_user, experience_params, type: "professional")
      expect{
        service.call
      }.to change(Skill, :count).by(3)
      expect(service.experience.skills.count).to eq(3)
    end
  end

end