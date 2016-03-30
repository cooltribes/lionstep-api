class TestResult < ActiveRecord::Base
  ### Relations
  belongs_to :user

  ### Callbacks
  before_update :check_completed


  private

  def check_completed
    if complete_changed?(from: false, to: true)
      ApplicationMailer.test_completed(user).deliver_later
    end
  end

end
