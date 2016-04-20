class V1::ResponsibilitiesController < V1::BaseController

  def index
    responsibilities = ResponsibilityLevel.for(current_locale).ransack(name_cont: params[:term]).result
    render json: responsibilities.as_json(only:[:name, :id])
  end

end