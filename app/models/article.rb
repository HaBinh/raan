module Status
  EXIST = 'exist'
  SOLD = 'sold'
end
class Article < ApplicationRecord
  belongs_to :product
  def beSold(order_item_id)
    update_attributes(status: Status::SOLD, order_item_id: order_item_id)
  end

  def beReturn
    update_attributes(status: Status::EXIST, order_item_id: nil)
  end
end
  