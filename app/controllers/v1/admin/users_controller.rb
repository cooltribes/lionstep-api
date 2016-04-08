class V1::Admin::UsersController < V1::Admin::BaseController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user, serializer: UserDetailSerializer
  end
end
