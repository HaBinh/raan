class StoresController < ApplicationController
  def index
    @ketqua, @total = Store.get_pagination(params[:search], params[:page], params[:per_page])
    @stores = @ketqua.sort { |x,y| y["time"] <=> x["time"] }
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
          render 'stores/create.json.jbuilder'
        end
      end

  def get_products    
    @results = Product.joins("left outer join( select * from articles where status='exist') as articles
                                     ON articles.product_id = products.id")
                      .select("products.*, count(articles.id) as quantity")
                      .group("products.id")
                      .order(:name)
    render 'stores/get_products'
  end  

  private 
      def article_params
        params.permit(:status, :imported_price, :product_id)
      end
end