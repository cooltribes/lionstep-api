class V1::Admin::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_admin!

  private

  def authorize_user(user)
    Pundit::NotAuthorizedError unless user == current_user
  end

  def meta_info(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end
end
