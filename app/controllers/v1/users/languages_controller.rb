class V1::Users::LanguagesController < V1::BaseController
  before_action :set_user

  def create
    authorize_user @user
    service = ::Languages::AddLanguagesToUser.new(@user, languages_params.fetch(:languages))
    if service.call
      render json: service.language_levels, status: :created
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_user @user
    language = Language.find(params[:id])
    @user.languages.destroy(language)
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def languages_params
    params.permit(languages: [:language_id, :level])
  end

end
