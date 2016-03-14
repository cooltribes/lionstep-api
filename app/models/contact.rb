class Contact < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Constants
  CONTACT_TYPE = { 0 => 'Email', 1 => 'Phone', 2 => 'Skype', 3 => 'Yahoo',
    4 => 'Facebook', 5 => 'Twitter', 6 => 'IRC', 7 => 'Web Site' }

  ### Relations
  belongs_to :contactable, polymorphic: true

  ### Validations
  validates_presence_of :info, :contact_type
  validates :contact_type, inclusion: { in: CONTACT_TYPE.keys }

  ### Instance Methods

  def contact_type_text
    CONTACT_TYPE[contact_type]
  end
end
