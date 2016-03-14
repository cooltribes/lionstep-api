class V1::Concerns::BaseAlbumsController < V1::BaseController
  before_action :set_albumable
  before_action :set_album, except: [:index, :create]

  def index
    authorize Album
    albums = Paginator::paginate(@albumable.albums, params)
    render json: albums, meta: meta_info(albums)
  end

  def show
    render json: @album
  end

  def create
    authorize Album
    service = ::Albums::CreateAlbum.new(current_user, @albumable, album_params)
    if service.call
      render json: service.album, status: :created
    else
      render json: service.album.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @album
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @album
    @album.destroy
    head :no_content
  end

  private

  def set_albumable
    raise "Implement this is in the subclass"
  end

  def set_album
    @album = @albumable.albums.find(params[:id])
  end

  def album_params
    params.permit(:name)
  end

  def pundit_user
    PolymorphicContext.new(current_user, @albumable)
  end
end
