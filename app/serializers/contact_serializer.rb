class ContactSerializer < ActiveModel::Serializer
  attributes :id, :info, :privacy, :contact_type_text
  belongs_to :contactable
end
