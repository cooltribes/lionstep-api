class Admin < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User
end
