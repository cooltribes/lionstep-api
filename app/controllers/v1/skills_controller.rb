class V1::SkillsController < V1::BaseController

  def index
    skills = Skill.for(current_locale).ransack(name_cont: params[:term]).result
    render json: skills.as_json(only:[:name, :id])
  end

end