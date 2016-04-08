class User < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  # Include default devise modules. :confirmable, :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable,
          :recoverable, :rememberable, :trackable, :validatable

  ### Constants
  #tmp
  ROLE_ID = { 1 => "regular", 2 => "external", 3 => "admin" }


  ### Extends and Includes
  include DeviseTokenAuth::Concerns::User

  ### Relations
  has_one :profile, dependent: :destroy
  has_one :test_result, dependent: :destroy
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :professional_experiences, dependent: :destroy
  has_many :academic_experiences, dependent: :destroy
  has_many :language_levels, dependent: :destroy
  has_many :languages, through: :language_levels
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :oauth_providers, dependent: :destroy
  has_many :user_extra_activities, dependent: :destroy
  has_many :extra_activities, through: :user_extra_activities


  ### Nested Atrributes
  accepts_nested_attributes_for :oauth_providers

  ### Callbacks
  after_create :initialize_profile, :create_test

  ### Delegations
  delegate :first_name, :last_name, :born_date, :country_code, :city, to: :profile

  ### Instance Methods
  def fullname
    "#{first_name} #{last_name}"
  end

  def role
    ROLE_ID[role_id]
  end

  def get_test_results
    TestProcessador.type_information[test_result.result]
  end

  private

  def initialize_profile
    profile || create_profile
  end

  def create_test
    create_test_result
  end
end
