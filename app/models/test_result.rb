class TestResult < ActiveRecord::Base
  ### Relations
  belongs_to :user

  ### Callbacks
  before_update :check_completed


  private

  def check_completed
    if complete_changed?(from: false, to: true)
      test = TestProcessador.new(self)
      self.result = test.type
      ApplicationMailer.test_completed(user).deliver_later
    end
  end

end
