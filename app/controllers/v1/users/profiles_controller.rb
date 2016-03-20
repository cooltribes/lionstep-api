class V1::Users::ProfilesController < V1::BaseController
  before_filter :set_user

  def show
    render json: @user.profile, status: :ok
  end

  def update
    authorize_user @user
    if @user.profile.update(profile_params)
      render json: @user.profile, status: :ok
    else
      render json: @user.profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def profile_params
    params.permit(:first_name, :last_name, :born_date, :country_code, :city, :avatar,
      :driver_license)
  end

end
