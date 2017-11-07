class Customer < ApplicationRecord
	# before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validates :email, presence: false, length: { maximum: 255 },
  #                   format:     { with: VALID_EMAIL_REGEX }
  validates :phone, length: { maximum: 50 }
  has_many :orders

  def deactive
    update_attributes(active: false)
  end
end
