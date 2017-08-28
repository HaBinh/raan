class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :destroy]
    
      def index
        @articles = Article.all
      end
    
      def create
        @article = Article.new(article_params)
        if @article.save
          render json: { article: @article }, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end
    
      def show 
    
      end
    
      def destroy 
        @article.destroy 
        head :ok
      end
    
      private 
    
      def article_params
        params.permit(:quantity, :price_sale, :product_id)
      end
    
      def set_article
        @article = Article.find_by_id(params[:id])
        if @article.nil? 
          render json: { message: 'Not found'}, status: :not_found
        end
      end
end
