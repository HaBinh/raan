class StoresController < ApplicationController
      def index
        @articles = Article.all
        @stores = Array.new
        Product.all.each do |p|
          @product=p.name
          @quantity = Article.where(product_id:p.id, status: "t").count
          @store = Article.where(product_id: p.id, status: "t").order(:created_at).last
          # byebug
          @store.status = @quantity
          @stores << @store              
        end   
      end
    end

  def get_products 
    @stores = Array.new
    Product.all.each do |product|
      store = Object.new 
      quantity = product.articles.where(status: Status::EXIST).count
      if quantity > 0 
        class << store 
          attr_accessor :product
          attr_accessor :quantity
        end
        store.product = product
        store.quantity = quantity
        @stores << store
      end
    end
    render 'stores/get_products'
  end  
end
