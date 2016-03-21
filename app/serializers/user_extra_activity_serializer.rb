class UserExtraActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :level

  def name
    object.extra_activity.name
  end
end
