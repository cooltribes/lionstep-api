class V1::Users::SkillsController < V1::BaseController
  before_filter :set_user

  def create
    authorize_user @user
    service = ::Skills::AddSkillsToUser.new(@user, skills_params[:skills])
    if service.call
      render json: service.user_skills, status: :created
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_user @user
    skill = Skill.find(params[:id])
    @user.skills.destroy(skill)
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def skills_params
    params.permit(skills: [:name, :level])
  end

end
