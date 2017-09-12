class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
  end

  def create
    @order = Order.create!(order_params)
    total_amount = 0
    if params[:order_items]
      params[:order_items].each do |item| 
        product = Product.find_by_id(item[:product_id])
        articles = product.articles.where(status: Status::EXIST).order(:created_at)
        if articles.count < item[:quantity].to_i 
          render_not_enough and return
        end

        order_item = @order.order_items.create!(quantity: item[:quantity])
        order_item.calculate_amount(item[:price_sale].to_f)
        total_amount += order_item.amount
        item[:quantity].times do |n|
          articles[n].beSold(order_item.id)
        end
      end
    end
    @order.update_attributes(total_amount: total_amount)
    render json: { order: @order }, status: :created
  end

  def show 

  end

  def destroy 
    @order.destroy 
    head :ok
  end

  private 

  def order_params
    params.require(:order).permit(:customer_id)
  end

  def set_order 
    @order = Order.find_by_id(params[:id])
    if @order.nil? 
      render json: { message: 'Not found'}, status: :not_found
    end
  end

  def render_not_enough 
    render( json: { message: 'not enough quantity' }, status: :unprocessable_entity )    
  end
end
