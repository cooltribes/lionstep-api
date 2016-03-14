class UserSkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :level

  def name
    object.skill.name
  end
end
