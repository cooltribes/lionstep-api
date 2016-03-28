class V1::AcademicDiplomasController < V1::BaseController

  def index
    diplomas = AcademicDiploma.for(current_locale).ransack(name_cont: params[:term]).result
    render json: diplomas.as_json(only:[:name, :id])
  end

end