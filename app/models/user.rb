class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  ROLES = %w[admin moderator author]

  
  ##def roles=(roles)
  #	self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  #end

  #def roles
  #	ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero?}
  #end

  def role?(role)
  	ROLES[0].include? role.to_s
  end

end
