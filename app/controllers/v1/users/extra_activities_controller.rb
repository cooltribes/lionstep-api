class V1::Users::ExtraActivitiesController < V1::BaseController
  before_filter :set_user

  def index
    activities = current_user.user_extra_activities
    render json: activities
  end

  def create
    authorize_user @user
    service = ::ExtraActivities::AddActivitiesToUser.new(@user, activities_params[:extra_activities])
    if service.call
      render json: service.user_extra_activities, status: :created
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_user @user
    activity = ExtraActivity.find(params[:id])
    @user.extra_activities.destroy(activity)
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def activities_params
    params.permit(extra_activities: [:name, :level])
  end

end
