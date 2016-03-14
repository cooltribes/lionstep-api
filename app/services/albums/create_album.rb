module Albums
  class CreateAlbum < BaseService

    attr_reader :album, :user, :albumable, :params

    def initialize(user, albumable, params)
      set_as_valid!
      @user = user
      @albumable = albumable
      @params = params
    end

    def call
      @album = Album.new(params)
      @album.owner = user
      if albumable.albums << @album
        set_as_valid!
      else
        set_as_invalid!
        set_errors @album.errors
      end
      valid?
    end
  end
end