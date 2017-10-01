class StoresController < ApplicationController
  def index
    @articles = Article.all
    @stores = Array.new
    Article.group(:product_id, :imported_price).count.to_a.each do |a| #{ |a| puts "#{a[0][0]} #{a[0][1]} #{a[1]}" }
      @quantity = Article.where(product_id: a[0][0], imported_price: a[0][1]).count
      @sold = Article.where(product_id: a[0][0], imported_price: a[0][1], status: Status::SOLD).count
      @store = Article.where(product_id: a[0][0], imported_price: a[0][1], status: Status::EXIST).order(:created_at).last
      unless @store.nil?
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
