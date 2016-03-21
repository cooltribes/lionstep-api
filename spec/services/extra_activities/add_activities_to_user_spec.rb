require 'rails_helper'

RSpec.describe ExtraActivities::AddActivitiesToUser, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let(:activities_collection) do
    [
      { name: "Play Soccer", level: 5 },
      { name: "Run!", level: 2 }
    ]
  end

  describe "#call" do
    it "should add activities to user and create a activities if not exists" do
      service = ExtraActivities::AddActivitiesToUser.new(current_user, activities_collection)
      expect{
        service.call
      }.to change(ExtraActivity, :count).by(2)
      expect(current_user.extra_activities.count).to eq(2)
    end
  end

end