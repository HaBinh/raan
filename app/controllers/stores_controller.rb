class StoresController < ApplicationController
      def index
        @articles = Article.all
        @stores = Array.new
        Article.group(:product_id, :imported_price).count.to_a.each do |a| #{ |a| puts "#{a[0][0]} #{a[0][1]} #{a[1]}" }
          @quantity = Article.where(product_id: a[0][0], imported_price: a[0][1]).count
          @sold = Article.where(product_id: a[0][0], imported_price: a[0][1], status: "f").count
          @store = Article.where(product_id: a[0][0], imported_price: a[0][1], status: "t").order(:created_at).last
          unless @store.nil?
            @store.status = @quantity
            @stores << @store
          end
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
