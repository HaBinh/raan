class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]
  
  def index
    @customers = Customer.all.where(active: true)
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
    # byebug
    Customer.find_by_id(params[:id]).update_attributes(name: params[:name], email: params[:email], phone: params[:phone], address: params[:address], level: params[:level])
    render json: {customer: Customer.find_by_id(params[:id])}
  end

  def destroy 
    if @customer.orders.count > 0 
      @customer.deactive
      render json: { permanently_delete: false, status: @customer.active }
    else
      @customer.destroy
      render json: { permanently_delete: true }
    end
  end

  def get_in_debt 
    # sql = "SELECT customer_id, id as order_id, name, phone, customer_paid
    #        FROM orders LEFT JOIN customers ON customers.id = orders.customer_id WHERE orders.fully_paid=false"
    # customers = Order.connection.select_all(sql).to_a 
    # customers.each do |customer|     
    # end
  
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
      params.permit(:name, :email, :phone, :address, :level)
    end
end
