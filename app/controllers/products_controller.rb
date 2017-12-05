class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @product = Product.where(active: true)
    if !current_user.isManager
         @product.each do |p|
          p.default_imported_price = 0
        end
      end
    @products=@product
  end

  def create
    # byebug
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
