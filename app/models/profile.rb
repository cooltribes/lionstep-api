class Profile < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Extension
  include Localizable

  ### Relations
  belongs_to :user

  ### Validations
  validates_presence_of :first_name, :last_name, :born_date, :country_code, :city, on: :update

  ### Instance Methods

  def full_name
    "#{first_name} #{last_name}"
  end

end
