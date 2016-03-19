class V1::Users::ProfessionalExperiencesController < V1::BaseController
  before_action :set_user
  before_action :set_experience, except: :create

  def index
    experiences = current_user.profesional_experiences
    render json: experiences
  end

  def create
    authorize_user @user
    service = ::Experiences::CreateExperience.new(@user, experience_params, type: "professional")
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
      render json: service.errors, status: :unprocessable_entity
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
    @experience = @user.professional_experiences.find(params[:id])
  end

  def experience_params
    params.permit(:position, :organization, :start_date, :end_date,
      :country_code, :city, :current, :sector_id, skills: [])
  end

end
