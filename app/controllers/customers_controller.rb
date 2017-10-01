class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]
  
  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render :show, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def show

  end

  def update
    @customer.update_attributes(customer_params)
    head :ok
  end

  def destroy 
    @customer.destroy 
    head :ok
  end

  def get_in_debt 
    # sql = "SELECT customer_id, id as order_id, name, phone, customer_paid
    #        FROM orders LEFT JOIN customers ON customers.id = orders.customer_id WHERE orders.fully_paid=false"
    # customers = Order.connection.select_all(sql).to_a 
    # customers.each do |customer|
      
    # end
    # byebug
    @customers_in_debt = Array.new
    customers = Customer.all 
    customers.each do |customer| 
      customer_in_debt = Object.new
      order_not_fully_paid = customer.orders.where(fully_paid: false)
      if order_not_fully_paid.count > 0 
        class << customer_in_debt
          attr_accessor :customer
          attr_accessor :orders
        end
        customer_in_debt.customer = customer 
        customer_in_debt.orders = order_not_fully_paid
        @customers_in_debt << customer_in_debt 
      end
    end
    render 'customers/customer_in_debt'
  end

  private 
    def set_customer 
      @customer = Customer.find_by_id(params[:id])
      if @customer.nil? 
        render json: { message: 'Not found'}, status: :not_found
      end
    end

    def customer_params
      params.permit(:name, :email, :phone, :address)
    end
end
