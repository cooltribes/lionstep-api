class V1::Albums::PicturesController < V1::BaseController
  before_action :set_album
  before_action :set_picture, except: [:index, :create]

  def index
    # authorize Picture
    pictures = Paginator::paginate(@album.pictures, params)
    render json: pictures, meta: meta_info(pictures)
  end

  def create
    # authorize Picture
    service = ::Pictures::CreatePicture.new(current_user, @album, picture_params)
    if service.call
      render json: service.picture, status: :created
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def update
    # authorize @picture
    if @picture.update(picture_params)
      render json: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # authorize @picture
    @picture.destroy
    head :no_content
  end

  private

  def set_album
    ## TODO create scope o function for get only the albums where the user can add pictures
    @album = Album.find(params[:album_id])
  end

  def set_picture
    @picture = @album.pictures.find(params[:id])
  end

  def picture_params
    params.permit(:title, :image)
  end

  def pundit_user
    PolymorphicContext.new(current_user, @albumable)
  end
end
