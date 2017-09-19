# Policy for Individual access
class IndividualPolicy
  attr_reader :user, :individual

  def initialize(user, individual)
    @user = user
    @individual = individual
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.admin? || user.power_user?
  end

  def create?
    new?
  end

  def edit?
    user.admin? || user.power_user?
  end

  def update?
    edit?
  end

  def destroy?
    user.admin? || user.power_user?
  end
end
