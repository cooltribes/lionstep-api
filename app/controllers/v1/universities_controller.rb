class V1::UniversitiesController < V1::BaseController

  def index
    universities = University.ransack(name_cont: params[:term]).result
    render json: universities.as_json(only:[:name, :id])
  end

end