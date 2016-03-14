module Pictures
  class CreatePicture < BaseService

    attr_reader :picture, :user, :album, :params

    def initialize(user, album, params)
      set_as_valid!
      @user = user
      @album = album
      @params = params
    end

    def call
      @picture = Picture.new(params)
      @picture.owner = user
      if album.pictures << @picture
        set_as_valid!
      else
        set_as_invalid!
        set_errors @picture.errors
      end
      valid?
    end
  end
end