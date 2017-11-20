class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :articles
  validates :quantity, numericality: { greater_than: 0 }
  validates :discounted_rate, numericality: { greater_than: -1 }
  
  def calculate_amount(price_sale)
    amount = price_sale * quantity.to_i * (1 - discounted_rate)
    self.update_attributes(amount: amount)
  end

  def return_calculate_after_return(quantity_return)
    self.amount = (self.amount / self.quantity ) * ( quantity - quantity_return )
    self.quantity = self.quantity - quantity_return
    self.save
  end
end
