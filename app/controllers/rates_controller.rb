class RatesController < ApplicationController
  def index
    @rates = DiscountedRate.all
  end

  def update
    if params[:rate2] != 'undefined'
      @rate2 = DiscountedRate.find_by_id(2).update(rate: params[:rate2])
    end
    if params[:rate3] != 'undefined'
      @rate3 = DiscountedRate.find_by_id(3).update(rate: params[:rate3])
    end
    if params[:rate4] != 'undefined'
      @rate4 = DiscountedRate.find_by_id(4).update(rate: params[:rate4])
    end
    if params[:rate5] != 'undefined'
      @rate5 = DiscountedRate.find_by_id(5).update(rate: params[:rate5])
    end
    if params[:rate6] != 'undefined'
      @rate6 = DiscountedRate.find_by_id(6).update(rate: params[:rate6])
    end
  end
end
