class Article < ApplicationRecord
  belongs_to :product
  validates :quatity, numericality: { greater_than: 0 }
end
