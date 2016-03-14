module Ownerable
  extend ActiveSupport::Concern

  included do
    belongs_to :owner, class_name: "User"

    validates :owner_id, presence: true
  end

  def user_is_owner?(user)
    owner == user
  end

  def change_owner(user)
    update(owner: user)
  end


end
