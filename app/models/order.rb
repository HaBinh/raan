class Order < ApplicationRecord
  before_create{ self.id = private_id }
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  def set_fully_paid(customer_paid)
    self.customer_paid = customer_paid
    if (customer_paid >= self.total_amount) 
      self.fully_paid = true;
    end

    self.save
  end

  def debt 
    if fully_paid?
      0
    else
      self.total_amount - self.customer_paid 
    end
  end
end
