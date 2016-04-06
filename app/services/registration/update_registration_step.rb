module Registration
  class UpdateRegistrationStep

    def initialize(user, params)
      @user = user
      @step = params.fetch(:step, nil)
      update_step! if @step
    end

    private
    attr_reader :user, :step

    def update_step!
      user.update(registration_step: step)
    end
  end
end