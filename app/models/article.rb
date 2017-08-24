class Article < ApplicationRecord
  belongs_to :product
  has_many :order_items
  validates :quantity, numericality: { greater_than: 0 }
end
  