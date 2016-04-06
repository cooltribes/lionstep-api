module Registration
  class UpdateRegistrationStep

    def initialize(user, step)
      @user = user
      @step = step
      update_step! if @step
    end

    private
    attr_reader :user, :step

    def update_step!
      user.update(registration_step: step)
    end
  end
end