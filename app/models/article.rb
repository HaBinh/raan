class Article < ApplicationRecord
  belongs_to :product
  has_many :order_items
  validates :quatity, numericality: { greater_than: 0 }
end
