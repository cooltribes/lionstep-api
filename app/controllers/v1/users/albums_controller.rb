class V1::Users::AlbumsController < V1::Concerns::BaseAlbumsController
  before_action :set_albumable
  before_action :set_album, except: [:index, :create]


  private

  def set_albumable
    @albumable = User.find(params[:user_id])
  end

end
