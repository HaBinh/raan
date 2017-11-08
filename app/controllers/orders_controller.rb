class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy, :return_order]

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def create
    if params[:order][:customer_paid].to_f <= 0 
      render_customer_paid_greater_than0 and return 
    end
    customer_id = params[:order][:customer_id]
    if customer_id.nil?
      params_customer = params.require(:order).permit(:name, :phone, :email, :address)
      customer = Customer.create!(params_customer)
      customer_id = customer.id
    end
    
    total_amount = 0
    if params[:order_items]
      params[:order_items].each do |item|
        product = Product.find_by_id(item[:product_id])
        articles = product.articles.where(status: Status::EXIST).order(:created_at)
        if articles.count < item[:quantity].to_i 
          render_not_enough and return
        end
        if item[:quantity].to_i <= 0 
          render_quantity_greater_than0 and return 
        end
      end

      @order = Order.create!(customer_id: customer_id, customer_paid: params[:order][:customer_paid].to_f)

      params[:order_items].each do |item| 
        product = Product.find_by_id(item[:product_id])
        articles = product.articles.where(status: Status::EXIST).order(:created_at)
        order_item = @order.order_items.create!(quantity: item[:quantity], 
                                                discounted_rate: item[:discounted_rate])
        order_item.calculate_amount(item[:price_sale].to_f)
        total_amount += order_item.amount
        item[:quantity].to_i.times do |n|
          articles[n].beSold(order_item.id)
        end
      end
    end
    
    @order.update_attributes(total_amount: total_amount.round(2))
    @order.set_fully_paid
    render json: { order: @order }, status: :created
  end

  def show 

  end

  def update 
    @order.pay_debt(params[:payment].to_f)
    render 'orders/order'
  end

  def return_order
    order_items = @order.order_items
    total_amount = 0 
    params[:order_items].each do |item|
      order_item = OrderItem.find_by_id(item[:id])
      articles_be_sold = order_item.articles.order(created_at: :desc)

      # Return article 
      item[:quantity_return].times do |n| 
        articles_be_sold[n].beReturn
      end

      total_amount += order_item.return_calculate_after_return(item[:quantity_return].to_i)
      
    end

    @order.update_attributes(total_amount: total_amount.round(2))
    @order.set_fully_paid
    head :ok
  end

  def destroy 
    @order.destroy 
    head :ok
  end

  def search
    @orders = Order.all.order(created_at: :desc)
    render 'orders/search'
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
    render( json: { message: 'Not enough quantity' }, status: :unprocessable_entity )    
  end

  def render_quantity_greater_than0
    render( json: { message: 'Quantity should be greater than 0' }, status: :unprocessable_entity )        
  end

  def render_customer_paid_greater_than0
    render( json: { message: 'Customer paid should be greater than 0' }, status: :unprocessable_entity )            
  end
end
