class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(Product_params)
    if @product.save
      render :show, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def show
    
  end

  def update
    @product.update_attributes(product_params)
    head :ok
  end

  def destroy 
    @product.destroy 
    head :ok
  end

  private 
    def set_product 
      @products= Product.find_by_id(params[:id])
    end

    def product_params
      params.permit(:name, :code, :categori, :price_sale)
    end
end
