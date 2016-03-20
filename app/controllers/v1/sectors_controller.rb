class V1::SectorsController < V1::BaseController

  def index
    sector = Sector.ransack(name_cont: params[:term]).result
    render json: sector.as_json(only:[:name, :id])
  end

end