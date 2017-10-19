class Product < ApplicationRecord
	has_many :articles
	validates_presence_of :name, :code, :default_imported_price, :default_sale_price
	validates :default_imported_price, numericality: { greater_than: 0 }
	validates :default_sale_price, numericality: { greater_than: 0 }
end
