class OrdersController < ApplicationController
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
    
  end

  private 

  def order_params
    params.require(:order).permit(:customer_id)
  end

  def get_order 
    @order = Order.find_by_id(params[:id])
    if @customer.nil? 
      render json: { message: 'Not found'}, status: :not_found
    end
  end
end
