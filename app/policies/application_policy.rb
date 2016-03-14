class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user == record
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user == record
  end

  def update?
    user == record
  end

  def destroy?
    user == record
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
