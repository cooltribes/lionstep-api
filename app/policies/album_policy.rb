class AlbumPolicy < ApplicationPolicy
  attr_reader :user, :album, :albumable

  def initialize(context, album)
    @user = context.user
    @albumable = context.parent
    @album = album
  end

  def index?
    true
  end

  def show?
    scope.albums.where(:id => album.id).exists?
  end

  def create?
    user == albumable || albumable.try(:user_is_admin?, user)
  end

  def update?
    user == album.owner || user == albumable || albumable.try(:user_is_admin?, user)
  end

  def destroy?
    user == album.owner || user == albumable || albumable.try(:user_is_admin?, user)
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
