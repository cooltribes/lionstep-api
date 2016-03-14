class LanguageLevelSerializer < ActiveModel::Serializer
  attributes :id, :name, :level

  def name
    object.language.name
  end
end
