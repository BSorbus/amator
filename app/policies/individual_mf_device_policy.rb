# Policy for IndividualMfDevice access
class IndividualMfDevicePolicy
  attr_reader :user, :individual_mf_device

  def initialize(user, individual_mf_device)
    @user = user
    @individual_mf_device = individual_mf_device
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
