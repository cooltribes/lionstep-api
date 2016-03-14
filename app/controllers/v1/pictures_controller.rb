class V1::PicturesController < ApplicationController

  def create
    # authorize Picture
    picture = Picture.new(picture_params)
    picture.owner = current_user
    if picture.save
      render json: picture, status: :created
    else
      render json: picture.errors, status: :unprocessable_entity
    end
  end

  private

  def picture_params
    params.permit(:title, :image)
  end

end