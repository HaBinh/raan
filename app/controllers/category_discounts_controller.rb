class CategoryDiscountsController < ApplicationController
    before_action :category_discount_params ,only: [:create, :update]
    before_action :set_category_discount ,only: [:destroy, :update, :show]
    def index
        @category_discounts, @total = CategoryDiscount.get_pagination(params[:page], params[:per_page], params[:search_text])
    end

    def create
        @category_discount = CategoryDiscount.new(category_discount_params)
        if @category_discount.save
        render :show, status: :created, location: @category_discount
        else
        render json: @category_discount.errors, status: :unprocessable_entity
        end
    end

    def show
    
    end

    def update
        @category_discount.update_attributes(category_discount_params)
        render :show, status: :updated, location: @category_discount
    end

    def destroy
        @category_discount.destroy
        render json: { permanently_delete: true }
    end

    private 
    def category_discount_params
        params.permit(:rate0, :rate1, :rate2, :rate3, :rate4, :rate5, :rate6)
    end

    def set_category_discount
      @category_discount = CategoryDiscount.find_by_id(params[:id])
      if @category_discount.nil? 
        render json: { message: 'Not found'}, status: :not_found
      end
    end
end
