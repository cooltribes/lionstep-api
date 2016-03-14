class Album < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Extends and Includes
  include Ownerable

  ### Relations
  belongs_to :albumable, polymorphic: true
  has_many :pictures, dependent: :destroy

  ### Validations
  validates :name, presence: true

end
