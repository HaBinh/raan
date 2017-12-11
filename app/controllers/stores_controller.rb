class StoresController < ApplicationController
  def index
    @articles = Article.all
    @stores = Array.new
    Article.group(:product_id).count.to_a.each do |a| #{ |a| puts "#{a[0][0]} #{a[0][1]} #{a[1]}" }
      if Article.where(product_id: a[0]).first.product.active === true
        @quantity = Article.where(product_id: a[0], status: Status::EXIST).count
        @sold = Article.where(product_id: a[0], status: Status::SOLD).count
        @store = Article.where(product_id: a[0], status: Status::EXIST).order(:created_at).last
        if !current_user.isManager
          @store.imported_price = 0
        end
        unless @store.nil?
          @store.status = @quantity
          @stores << @store
        end
      end
    end
    @stores = @stores.sort { |x,y| y.created_at <=> x.created_at }
  end

  def get_products 
    @stores = Array.new
    Product.where(active: true).each do |product|
      store = Object.new 
      quantity = product.articles.where(status: Status::EXIST).count
      
      class << store 
        attr_accessor :product
        attr_accessor :quantity
      end
      store.product = product
      store.quantity = quantity
      @stores << store
    end
    render 'stores/get_products'
  end  
end
