class RatesController < ApplicationController
  def index
    @rates = DiscountedRate.all
  end

  def creat
    @rate = DiscountedRate.new(params)
  end

  def update
    DiscountedRate.find_by_id(params[:rate_id]).update(rate: params[:rate])
    
  end

  def delete
    @rate = DiscountedRate.find_by_id(params[:id])
    if @rate.nil? 
      render json: { message: 'Not found'}, status: :not_found
    end
  end

end
