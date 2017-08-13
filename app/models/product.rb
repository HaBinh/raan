class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy
  validates_presence_of :name, :code
end
