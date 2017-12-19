class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    query = "SELECT products.*, rate FROM products INNER JOIN
             product_discounted_rates on product_discounted_rates.product_id = products.id
             WHERE products.active=true "

    results = ActiveRecord::Base.connection.execute(query).to_a
    results2 = results.group_by{ |i| i["id"]}
    @products = Array.new
    results2.each do |res| 
      product_info = res.second.first
      rates = res.second.group_by{ |i| i["rate"]}
      rates = rates.map{ |k, v| k }
      product = Object.new
      class << product
        attr_accessor :product
        attr_accessor :rates
      end
      product.rates = rates 
      product.product = product_info
      @products << product
    end
  end

  def addStorage
     query = "SELECT products.*, rate FROM products INNER JOIN
             product_discounted_rates on product_discounted_rates.product_id = products.id
             WHERE products.active=true "

    results = ActiveRecord::Base.connection.execute(query).to_a
    results2 = results.group_by{ |i| i["id"]}
    @products = Array.new
    results2.each do |res| 
      product_info = res.second.first
      rates = res.second.group_by{ |i| i["rate"]}
      rates = rates.map{ |k, v| k }
      product = Object.new
      class << product
        attr_accessor :product
        attr_accessor :rates
      end
      product.rates = rates 
      product.product = product_info
      @products << product
    end

    render 'products/index.json.jbuilder'
  end

  def create
    @product = Product.new(name: params[:name], code: params[:code], unit: params[:unit], default_imported_price: params[:default_imported_price],default_sale_price: params[:default_sale_price])
    if @product.save
        rates_params.sort { |x,y| x <=> y }.each do |a|    
        ProductDiscountedRate.create!(
            rate: a,
            product_id:  @product.id
          )
      end
      render :show, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def show
    
  end

  def update
    @product.update_attributes(name: params[:name], code: params[:code], unit: params[:unit], 
                               default_imported_price: params[:default_imported_price],
                               default_sale_price: params[:default_sale_price])
    @product.product_discounted_rates.delete_all
    params[:rates].sort { |x,y| x <=> y }.each do |a|    
        @product.product_discounted_rates.create!(
          rate: a
        )
    end
    render 'products/show.json.jbuilder'
  end
  
  def destroy   
    if Article.where(product_id: @product.id).count === 0
      @product.destroy
      render json: {message: 'deleted'}
    else
      @product.update_attributes(active: !@product.active)
      render json: {message: 'inactive'}
    end 
    # head :ok
  end

  private 
    def set_product 
      @product = Product.find_by_id(params[:id])
      if @product.nil? 
        render json: { message: 'Not found'}, status: :not_found
      end
    end

    def rates_params
        return params[:rates].each do |a|
          a.to_f
        end
    end
    
end
