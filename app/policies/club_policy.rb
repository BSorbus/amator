class ClubPolicy
  attr_reader :user, :club

  def initialize(user, club)
    @user = user
    @club = club
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
