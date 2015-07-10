class User < ActiveRecord::Base
  enum role: [:user, :power_user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :rememberable, :lockable, :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :timeoutable, :confirmable, 
  		:trackable, :validatable, :authentication_keys => [:email]

	#validates_format_of :email, :with =>  /\A[\w+\-.]+@uke.gov.pl/i
  #validacja w /config/initializers/device.rb -> config.email_regexp = /\A([\w\.%\+\-]+)@uke\.gov\.pl\z/i

end
