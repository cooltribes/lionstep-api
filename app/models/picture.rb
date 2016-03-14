class Picture < ActiveRecord::Base
  ### Gems
  acts_as_paranoid
  mount_uploader :image, ImageUploader

  ### Extends and Includes
  include Ownerable

  ### Relations
  belongs_to :album

end
