class ClubMfDevicePolicy
  attr_reader :user, :club_mf_device

  def initialize(user, club_mf_device)
    @user = user
    @club_mf_device = club_mf_device
  end


  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.admin? or user.power_user?
  end

  def create?
    new?
  end

  def edit?
    user.admin? or user.power_user?
  end

  def update?
    edit?
  end

  def destroy?
    user.admin? or user.power_user?
  end

end
