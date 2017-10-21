class RatesController < ApplicationController
  def index
    @rates = DiscountedRate.all
  end

  def create
    @rate = DiscountedRate.create(rate_params)
    if @rate.save
      render 'rates/show'
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  def update
    DiscountedRate.find_by_id(params[:rate_id]).update(rate_params)
  end

  def destroy
    @rate = DiscountedRate.find_by_id(params[:id]).destroy 
    head :ok
  end
  private 


  def rate_params
    params.permit(:rate)
  end

end
