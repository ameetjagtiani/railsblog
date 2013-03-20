class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
      :role, :roles, :provider, :uid, :name, :oauth_token, :oauth_expires_at
  has_many :posts
  
  ROLES = %w[admin moderator author]
  
  def roles=(roles)
  	self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
  	ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero?}
  end

  def role?(role)
  	roles.include? role.to_s
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid 
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #user.email = "dummy@aol.com"
      #user.password = "art607gum"
      #user.roles_mask = 1
      user.save!
    end

  end

end
