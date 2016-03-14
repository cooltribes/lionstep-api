class V1::Authentication::RegistrationsController < DeviseTokenAuth::RegistrationsController

  def sign_up_params
    params.permit(:email, :password, :password_confimation, oauth_providers_attributes: [:uid, :provider])
  end

  protected
    def render_create_success
      render json: @resource, serializer: CurrentUserSerializer
    end
end