class StoresController < ApplicationController
      def index
        @articles = Article.all
        @stores = Array.new
        Product.all.each do |p|
          @product=p.name
          @quantity = Article.where(product_id:p.id).count
          @store = Article.where(product_id: p.id).order(:created_at).last
          @store.status = @quantity
          @stores << @store
        end
      end
end
# Code good, try it
# @stores = Array.new
# Product.all.each do |p|
#   product=p.name
#   quantity = Article.where(product_id:p.id).count
#   last_imported = Article.where(product_id: p.id).order(:created_at).last
#   @stores << { name: product, quantity: quantity, last_imported: last_imported }
# end
# @stores.each do |s|
#   s[:product]
# end
