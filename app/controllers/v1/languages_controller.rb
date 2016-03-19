class V1::LanguagesController < V1::BaseController
  # skip_before_action :authenticate_user!

  def index
    languages = Language.ransack(name_cont: params[:term]).result
    render json: languages.as_json(only:[:name, :id])
  end

end