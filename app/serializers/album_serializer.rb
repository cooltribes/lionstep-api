class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :owner
  belongs_to :albumable
  has_many :pictures
end
