class V1::SectorsController < V1::BaseController

  def index
    sectors = Sector.for(current_locale).ransack(name_cont: params[:term]).result
    render json: sectors.as_json(only:[:name, :id])
  end

end