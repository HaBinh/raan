class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @ketqua, @total = Product.get_pagination(params[:search], params[:page], params[:per_page])
    results2 = @ketqua.group_by{ |i| i["id"]}
    @products = Array.new
    results2.each do |res| 
      product_info = res.second.first
      rates = res.second.map{ |i| i["rate"]}
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
    @ketqua, @total = Product.get_pagination(params[:search], params[:page], params[:per_page])
    results2 = @ketqua.group_by{ |i| i["id"]}
    @products = Array.new
    results2.each do |res| 
      product_info = res.second.first
      rates = res.second.map{ |i| i["rate"]}
      product = Object.new
      class << product
        attr_accessor :product
        attr_accessor :rates
      end
      product.rates = rates 
      product.product = product_info
      @products << product
    end

    render 'products/addStorage.json.jbuilder'
  end

  def create
    @product = Product.new(name: params[:name], code: params[:code], unit: params[:unit], default_imported_price: params[:default_imported_price],default_sale_price: params[:default_sale_price])
    if @product.save
        rates_params.each do |a|    
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
    params[:rates].each do |a|    
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
