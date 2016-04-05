require 'rails_helper'

RSpec.describe TestResult, type: :model do
  describe "callbacks" do
    describe "#check_completed" do
      let(:user){ User.make!(:confirmed) }

      before do
        user.test_result.update(
          :extraversion => 3,
          :feeling => 3,
          :introversion => 1,
          :judging => 3,
          :intuition => 3,
          :perceiving => 2,
          :sensing => 1,
          :thinking => 1
        )
      end

      it "Should store the result of tests" do
        expect(user.test_result.complete).to eq(false)
        expect {
          user.test_result.update(complete: true)
        }.to change(user.test_result, :result).from(nil).to("ENFJ")
      end

      it "Should send a email when the user completed the test" do
        user = User.make!(:confirmed)
        expect(user.test_result.complete).to eq(false)
        expect {
          user.test_result.update(complete: true)
        }.to enqueue_a(ActionMailer::DeliveryJob)
      end
    end
  end
end