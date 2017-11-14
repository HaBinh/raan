class ProductDiscoutedratesController < ApplicationController
    before_action :set_discoutedRates , only:[:show, :update]
    def index
        @discoutedRates = ProductDiscountedRate.where(product_id: params[:id]).sort { |x,y| x.rate <=> y.rate }
    end

    def show

    end

    def update
        @discoutedRates.update_attributes(rate_params)
        render json: {discoutedRates: @discoutedRates}
    end

    private
        def set_discoutedRates
            @discoutedRates = ProductDiscountedRate.find_by_id(params[:id])
        end

        def rate_params
            params.permit(:rate)
        end

end
