class V1::Authentication::TokenValidationsController < DeviseTokenAuth::TokenValidationsController

  protected
    def render_validate_token_success
      render json: @resource, serializer: CurrentUserSerializer
    end
end