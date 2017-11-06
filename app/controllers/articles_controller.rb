class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
      def index
        @articles = Array.new
        @exists  = Array.new
        byebug
        if current_user.isManager
          Article.group(:product_id, :imported_price).count.to_a.each do |a| #{ |a| puts "#{a[0][0]} #{a[0][1]} #{a[1]}" }
            @quantity = Article.where(product_id: a[0][0], imported_price: a[0][1]).count
            @sold = Article.where(product_id: a[0][0], imported_price: a[0][1], status: Status::SOLD).count
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
              @articles = @articles.sort { |x,y| y.created_at <=> x.created_at }
            end
          end
        else
          Article.group(:product_id, :imported_price).count.to_a.each do |a| #{ |a| puts "#{a[0][0]} #{a[0][1]} #{a[1]}" }
            @quantity = Article.where(product_id: a[0][0], imported_price: a[0][1], created_by: current_user.id).count
            @sold = Article.where(product_id: a[0][0], imported_price: a[0][1], status: Status::SOLD, created_by: current_user.id).count
            @store = Article.where(product_id: a[0][0], imported_price: a[0][1], created_by: current_user.id).order(:created_at).last
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
              @articles = @articles.sort { |x,y| y.created_at <=> x.created_at }
            end
          end
        end
      end

      def create
        params.permit(:status, :imported_price, :product_id)
        for i in (1..params[:quantity].to_i)
          @article = Article.new(article_params)
          @article.created_by = current_user.id
          @article.save
        end
        if @article.save
          @article.id = params[:quantity].to_i
          @article.status = @article.created_at.strftime("%A, %d/%m/%Y")
          render json: { article: @article }, status: :created
        end
      end

      def update
        @article = Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old])
        @sold =  Article.where(product_id:params[:product_id], imported_price: params[:imported_price_old], status: Status::SOLD).count  
        if @sold === 0
          if @article.count < params[:new_quantity].to_i      
            for i in (1..params[:new_quantity].to_i - @article.count)
              @article = Article.new(article_params)
              @article.save    
            end  
            Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old]).update_all(imported_price: params[:imported_price])
            render json: { message: 'updated'}, status: :updated
          else
          
            @article.limit(@article.count - params[:new_quantity].to_i).destroy_all
            Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old]).update_all(imported_price: params[:imported_price])
            render json: { message: 'updated'}, status: :updated
          end
        else
          if params[:new_quantity].to_i > @sold 
            if params[:new_quantity].to_i >= Article.where(product_id: params[:product_id], imported_price: params[:imported_price_old]).count
              for i in (1..params[:new_quantity].to_i - @article.count)
                @article = Article.new(article_params)
                @article.save
              end
            else
              Article.where(product_id:params[:product_id], imported_price: params[:imported_price_old], status: "t").limit(@article.count - params[:new_quantity].to_i).destroy_all
            end
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
