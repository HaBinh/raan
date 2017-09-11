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
