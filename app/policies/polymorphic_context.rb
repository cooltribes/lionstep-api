class PolymorphicContext
  attr_reader :user, :parent

  def initialize(user, parent)
    @user = user
    @parent = parent
  end
end
