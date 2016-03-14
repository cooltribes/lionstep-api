class V1::Users::AcademicExperiencesController < V1::BaseController
  before_action :set_user
  before_action :set_experience, except: [:index, :create]

  def index
  end

  def create
    authorize_user @user
    service = ::Experiences::CreateExperience.new(@user, experience_params, type: "academic")
    if service.call
      render json: service.experience, status: :created
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize_user @user
    service = ::Experiences::UpdateExperience.new(@user, @experience, experience_params)
    if service.call
      render json: service.experience, status: :ok
    else
      render json: service.experience.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_user @user
    @experience.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_experience
    @experience = @user.academic_experiences.find(params[:id])
  end

  def experience_params
    params.permit(:degree, :institution, :start_date, :end_date, :minimum_grade,
      :maximum_grade, :actual_grade, :country_code, :city, skills: [])
  end

end
