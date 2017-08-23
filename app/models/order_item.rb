class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :article
  validates :quantity, numericality: { greater_than: 0 }
end
