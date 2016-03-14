module Albumable
  extend ActiveSupport::Concern

  included do
    has_many :albums, as: :albumable, dependent: :destroy
    has_many :pictures, through: :albums
  end

  def default_album
    albums.find_or_create_by(name: "default")
  end

  def find_album(name)
    albums.find_by(name: name).first
  end

  def add_pictures_to_album(pictures_ids, album)
    pictures = Picture.where(id: pictures_ids)
    if album && pictures
      pictures.each do |picture|
        album.pictures << picture
      end
    else
      #TODO: Add new exception for this
      raise
    end
  end

end
