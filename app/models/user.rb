class User < ActiveRecord::Base
  enum role: [:user, :power_user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, 
  		:rememberable, :trackable, :validatable, :authentication_keys => [:email]

	validates_format_of :email, :with =>  /\A[\w+\-.]+@uke.gov.pl/i


end
