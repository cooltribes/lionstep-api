class V1::AuthController < DeviseTokenAuth::SessionsController


  def provider

    q = "uid = ? AND provider = ?"

    if ActiveRecord::Base.connection.adapter_name.downcase.starts_with? 'mysql'
      q = "BINARY " + q
    end

    # FIX
    @resource = OauthProvider.where(q, params[:uid], params[:provider]).first.try(resource_name)

    if @resource and (!@resource.respond_to?(:active_for_authentication?) or @resource.active_for_authentication?)
      # create client id
      @client_id = SecureRandom.urlsafe_base64(nil, false)
      @token     = SecureRandom.urlsafe_base64(nil, false)

      @resource.tokens[@client_id] = {
        token: BCrypt::Password.create(@token),
        expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
      }
      @resource.save

      sign_in(:user, @resource, store: false, bypass: false)

      yield if block_given?

      render_create_success
    elsif @resource and not (!@resource.respond_to?(:active_for_authentication?) or @resource.active_for_authentication?)
      render_create_error_not_confirmed
    else
      render_create_error_bad_credentials
    end
  end

end

