class RatesController < ApplicationController
  def index
    @rates = DiscountedRate.all
  end
end
