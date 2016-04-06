class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from Exception, with: :render_error


  private

  def current_locale
    I18n.locale.to_s
  end

  def render_error(e)
    error = RenderException.new(e)
    render json: error, status: error.status
  end
end
