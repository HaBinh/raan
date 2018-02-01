class StoresController < ApplicationController
  def index
    @ketqua, @total = Store.get_pagination(params[:search], params[:page], params[:per_page])
    @stores = @ketqua.sort { |x,y| y["time"] <=> x["time"] }
  end

  def create
        import_params = params.permit(:imported_price, :product_id, :quantity)
        @article = Import.new(import_params)
        @article.user_id = current_user.id
        @article.quantity_sold = 0
        @article.save
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