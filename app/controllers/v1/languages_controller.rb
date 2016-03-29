class V1::LanguagesController < V1::BaseController

  def index
    languages = Language.for(current_locale).ransack(name_cont: params[:term]).result
    render json: languages.as_json(only:[:name, :id])
  end

end