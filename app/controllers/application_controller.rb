class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from Exception, with: :render_error


  private

  def render_error(e)
    error = RenderException.new(e)
    render json: error, status: error.status
  end
end
