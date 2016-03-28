class V1::AcademicAreasController < V1::BaseController

  def index
    areas = AcademicArea.for(current_locale).ransack(name_cont: params[:term]).result
    render json: areas.as_json(only:[:name, :id])
  end

end