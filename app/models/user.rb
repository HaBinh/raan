class User < ActiveRecord::Base
  # Include default devise modules.
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  def isManager
    self.role === 'manager'
  end

  def isActive
  	self.active
  end
end
