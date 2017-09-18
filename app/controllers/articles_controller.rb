class ArticlesController < ApplicationController
    # before_action :set_article, only: [:show, :update]
      def index
        @articles = Array.new
        @exists  = Array.new
        Article.group(:product_id, :imported_price).count.to_a.each do |a| #{ |a| puts "#{a[0][0]} #{a[0][1]} #{a[1]}" }
          @quantity = Article.where(product_id: a[0][0], imported_price: a[0][1]).count
          @sold = Article.where(product_id: a[0][0], imported_price: a[0][1], status: "f").count
          @store = Article.where(product_id: a[0][0], imported_price: a[0][1]).order(:created_at).last
          unless @store.nil?
            if @sold > 0
              @store.product.category = false
              @store.product.name = @sold
            else 
              @store.product.category = true
              @store.product.name = 0
            end
            @store.status = @quantity
            @articles << @store
          end
          # byebug
        end
      end
    
      def create
        for i in (1..params[:quantity].to_i)
          @article = Article.new(article_params)
          @article.save
          # byebug
        end
        if @article.save
          render json: { article: @article }, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def update
        # byebug
        @article = Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old])
        @sold =  Article.where(product_id:params[:product_id], imported_price: params[:imported_price_old], status: "f").count  
        if @sold === 0
          if @article.count < params[:new_quantity].to_i      
            for i in (1..params[:new_quantity].to_i - @article.count)
              @article = Article.new(article_params)
              @article.save    
            end  
            Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old]).update_all(imported_price: params[:imported_price])
            render json: { message: 'updated'}, status: :updated
          else
            # byebug
            @article.limit(@article.count - params[:new_quantity].to_i).destroy_all
            Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old]).update_all(imported_price: params[:imported_price])
            render json: { message: 'updated'}, status: :updated
          end
        else
          if params[:new_quantity].to_i > @sold 
            # @article.update_attributes(article_params)
            if params[:new_quantity].to_i >= Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old]).count
              for i in (1..params[:new_quantity].to_i - @article.count)
                @article = Article.new(article_params)
                @article.save
                render json: { message: 'Not found'}, status: :not_found
              end
            else
              Article.where(product_id:params[:product_id], imported_price: params[:imported_price_old], status: "t").limit(@article.count - params[:new_quantity].to_i).destroy_all
            end
          else
            render json: { message: 'Not found'}, status: :not_found
          end
        end
        head :ok
      end
    
      def show 
    
      end

      def destroy 
        @article = Article.where(product_id: params[:product_id], imported_price: params[:imported_price])
        if @article.nil? 
          render json: { message: 'Not found'}, status: :not_found
        else
          render json: { message: 'Not found'}, status: :not_found
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
