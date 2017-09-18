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
        params_article = item.permit(:article_id, :status)
        order_item = @order.order_items.create!(params_article)
        
        order_item.calculate_amount(item[:price_sale].to_f)
        total_amount += order_item.amount
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
end
