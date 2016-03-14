class ContactPolicy < ApplicationPolicy
  attr_reader :user, :contact, :contactable

  def initialize(context, contact)
    @user = context.user
    @contactable = context.parent
    @contact = contact
  end

  def index?
    true
  end

  def show?
    scope.contacts.where(:id => contact.id).exists?
  end

  def create?
    user == contactable || contactable.try(:user_is_admin?, user)
  end

  def update?
    user == contactable || contactable.try(:user_is_admin?, user)
  end

  def destroy?
    user == contactable || contactable.try(:user_is_admin?, user)
  end

  def scope
    Pundit.policy_scope!(user.class)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
