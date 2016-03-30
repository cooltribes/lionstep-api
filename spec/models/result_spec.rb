require 'rails_helper'

RSpec.describe TestResult, type: :model do
  describe "callbacks" do
    describe "#check_completed" do
      it "Should send a email when the user completed the test" do
        user = User.make!(:confirmed)
        expect(user.test_result.complete).to eq(false)
        expect {
          user.test_result.update(complete: true, sensing: 3)
        }.to enqueue_a(ActionMailer::DeliveryJob)
      end
    end
  end
end