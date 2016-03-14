class PictureSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :owner
  belongs_to :album
end
