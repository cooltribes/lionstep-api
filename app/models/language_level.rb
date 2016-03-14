class LanguageLevel < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Relations
  belongs_to :user
  belongs_to :language

  ### Validations
  validates_presence_of :language_id
end
