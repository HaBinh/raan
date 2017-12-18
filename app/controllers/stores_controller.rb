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

    # query = "select count(articles.id) as quantity, products.* from products inner join articles 
    #           on products.id = articles.product_id
    #           where products.active=true and articles.status='exist'
    #           group by products.id"

   

    @results = Product.left_joins(:articles)
                      .select("products.*, count(articles.id) as quantity")
                      .group("products.id")
    render 'stores/get_products'
  end  
end
