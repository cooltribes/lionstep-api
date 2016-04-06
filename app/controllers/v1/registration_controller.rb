class V1::RegistrationController < V1::BaseController

  def step
    render json: { step: current_user.registration_step }, status: :ok
  end

  def update
    ::Registration::UpdateRegistrationStep.new(current_user, param_step)
    render json: { step: current_user.registration_step }, status: :ok
  end

  private

  def param_step
    params.permit(:step).fetch(:step, nil)
  end

end