class ProductDiscoutedratesController < ApplicationController
    before_action :set_discoutedRates , only:[:show, :update]
    def index
        @discoutedRates = ProductDiscountedRate.where(product_id: params[:id]).sort { |x,y| x.rate <=> y.rate }
    end

    def show

    end

    def update
        # byebug
        @discoutedRates.update_attributes(rate_params)
        render json: {discoutedRates: @discoutedRates}
    end

    def change
        @category = Category.where(id:  params[:_json]).first
        @rate = JSON.parse(@category.rates)
        @products = Product.where(category_id: params[:_json])
        @products.each do |product|
            @discount_rate = product.product_discounted_rates
            count = 7
            @discount_rate.each do |rate|
                count -= 1
                rate.update_attributes(rate: @rate [count])
            end
        end
    end

    private
        def set_discoutedRates
            @discoutedRates = ProductDiscountedRate.find_by_id(params[:id])
        end

        def rate_params
            params.permit(:rate)
        end

end
