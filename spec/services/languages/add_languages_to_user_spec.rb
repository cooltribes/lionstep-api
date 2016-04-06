require 'rails_helper'

RSpec.describe Registration::UpdateRegistrationStep, type: :service do
  let!(:current_user){ User.make!(:confirmed) }

  it "should extract the step from params and update the step of user" do
    params = { value: 1, value2: 2, step: "step 1" }
    expect{
      Registration::UpdateRegistrationStep.new(current_user, params)
    }.to change(current_user, :registration_step).from(nil).to("step 1")
  end

end