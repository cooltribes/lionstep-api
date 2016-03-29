class V1::AcademicDegreesController < V1::BaseController

  def index
    degrees = AcademicDegree.for(current_locale).ransack(name_cont: params[:term]).result
    render json: degrees.as_json(only:[:name, :id])
  end

end