class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
      def index
        @article, @total1 = Article.get_pagination(params[:search], params[:page], params[:per_page])
        @article.each do |a|
          if a["sold"].nil?
            a["sold"] = 0
          end
        end
        if !current_user.isManager
            @article.map { |a| a["imported_price"] = 0 }
        end
        @articles = @article
        @total = @total1
      end

      def create
        params.permit(:status, :imported_price, :product_id)
        time = Time.now
        for i in (1..params[:quantity].to_i)
          @article = Article.new(article_params)
          @article.created_by = current_user.id
          @article.created_at = time
          @article.save
        end
        if @article.save
          render 'articles/create.json.jbuilder'
        end
      end

      def update
        @article = Article.where(created_at: params[:created_at])
        @sold =  Article.where(created_at: params[:created_at], status: Status::SOLD).count  
        if @sold === 0
          if @article.count < params[:new_quantity].to_i      
            for i in (1..params[:new_quantity].to_i - @article.count)
              article = Article.new(article_params)
              article.created_at = @article.first.created_at
              article.save    
            end  
            Article.where(created_at: params[:created_at]).update_all(imported_price: params[:imported_price])
            render json: { message: 'updated'}, status: :updated
          else
            @article.limit(@article.count - params[:new_quantity].to_i).destroy_all
            Article.where(created_at: params[:created_at]).update_all(imported_price: params[:imported_price])
            render json: { message: 'updated'}, status: :updated
          end
        else
          if params[:new_quantity].to_i > @sold 
            if params[:new_quantity].to_i >= @article.count
              for i in (1..params[:new_quantity].to_i - @article.count)
                article = Article.new(article_params)
                article.created_at = @article.first.created_at
                article.save    
              end
            else
              Article.where(created_at: params[:created_at]).limit(@article.count - params[:new_quantity].to_i).destroy_all
            end
          end
        end
        head :ok
      end
    
      def show 
    
      end

      def destroy 
        @article = Article.where(created_at: params[:created_at].to_datetime)
        if @article.nil? 
          render json: { message: 'Not found'}, status: :not_found
        else
          @article.delete_all
          head :ok
        end
      end
    
      private 
      def article_params
        params.permit(:status, :imported_price, :product_id)
      end
    
      def set_article
        @article = Article.find_by_id(params[:id])
        if @article.nil? 
          render json: { message: 'Not found'}, status: :not_found
        end
      end
end
