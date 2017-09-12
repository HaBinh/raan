module Status
  EXIST = 'exist'
  SOLD = 'sold'
end
class Article < ApplicationRecord
  belongs_to :product
  has_one :order_item

  def beSold
    update_attributes(status: Status::SOLD)
  end
end
  