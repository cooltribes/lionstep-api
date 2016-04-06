require 'rails_helper'

RSpec.describe Registration::UpdateRegistrationStep, type: :service do
  let!(:current_user){ User.make!(:confirmed) }

  it "should extract the step from params and update the step of user" do
    expect{
      Registration::UpdateRegistrationStep.new(current_user, "step 1")
    }.to change(current_user, :registration_step).from(nil).to("step 1")
  end

end