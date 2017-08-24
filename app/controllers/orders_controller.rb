class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    
  end

  def create
    @order = Order.create!(order_params)
    if params[:order_items]
      params[:order_items].each do |item| 
        @order.order_items.create!(article_id: item[:article_id], 
                                   quantity: item[:quantity])
      end
    end
    head :ok
  end

  def show 
    @order_items = @order.order_items
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
