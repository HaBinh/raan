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
