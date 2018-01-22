class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy, :return_order]

  def index
    @orders = Order.joins("inner join customers on customers.id = orders.customer_id")
                   .select("orders.*, name, email, phone, address")
                   .order("orders.created_at desc")
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
          render_not_enough( product, articles.count ) and return
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
    
    @order.update_attributes(total_amount: total_amount.round(-2))
    @order.set_fully_paid
    render json: { order: @order }, status: :created
  end

  def show 

  end

  def update 
    @order.pay_debt(params[:payment].to_f)
    render 'orders/show.json.jbuilder'
  end

  def return_order
    order_items = @order.order_items
    params[:order_items].each do |item|
      order_item = OrderItem.find_by_id(item[:id])
      articles_be_sold = order_item.articles.order(created_at: :desc)

      # Return article 
      item[:quantity_return].to_i.times do |n| 
        articles_be_sold[n].beReturn
      end
      if ( item[:quantity_return].to_i == order_item.quantity )
        order_item.destroy
      else
        order_item.return_calculate_after_return(item[:quantity_return].to_i)
      end
      
    end

    total_amount = @order.total_amount
    customer_paid = @order.customer_paid
    new_total_amount = @order.order_items.sum(:amount).round(-2)
    @paid_return_user = 0 

    if new_total_amount < @order.customer_paid
      @paid_return_user = @order.customer_paid - new_total_amount
      customer_paid = new_total_amount
    end
    
    @order.calculate_total_amount
    @order.customer_paid =  customer_paid
    @order.save
    @order.set_fully_paid
    
    render 'orders/return_order'
  end

  def destroy 
    @order.destroy 
    head :ok
  end

  def search
    @orders = Order.joins("inner join customers on customers.id = orders.customer_id")
                   .select("orders.id as id, orders.created_at as created_at, name, email, phone, address")
                   .order("orders.created_at")
    render 'orders/search'
  end

  def quote
    OrderMailer.quote_price(params[:email], params[:code_html]).deliver_now
  end

  private 

  def set_order 
    @order = Order.find_by_id(params[:id])
    if @order.nil? 
      render json: { message: 'Not found'}, status: :not_found
    end
  end

  def render_not_enough(product, quantity)
    render( json: { error_info: { name: product.name, quantity: quantity } }, status: :unprocessable_entity )    
  end

  def render_quantity_greater_than0
    render( json: { message: 'Quantity should be greater than 0' }, status: :unprocessable_entity )        
  end

  def render_customer_paid_greater_than0
    render( json: { message: 'Customer paid should be greater than 0' }, status: :unprocessable_entity )            
  end
end
