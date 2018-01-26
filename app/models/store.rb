class Store < ApplicationRecord
  belongs_to :product
  has_many :order_items, dependent: :destroy

  def self.get_pagination(search_text, page, per_page)
		if page
			WillPaginate::Collection.create(page, per_page) do |pager|
			if search_text.blank?
			  sql2="select id, code, name, quantity, price, time
              from  (select product_id, count(product_id) as quantity, min(created_at) as time, min(imported_price) as price
                    from articles
                    where status = 'exist'
                    group by product_id) article
                    inner join products 
                    on products.id = article.product_id
                    LIMIT #{pager.per_page} OFFSET #{pager.offset}"
        @ketqua = ActiveRecord::Base.connection.execute(sql2).to_a
  		else
        search_text = "%#{search_text}%"
        sql="select id, code, name, quantity, price, time
              from  (select product_id, count(product_id) as quantity, min(created_at) as time, min(imported_price) as price
                    from articles
                    where status = 'exist'
                    group by product_id) article
                    inner join products 
                    on products.id = article.product_id
              WHERE (name LIKE '#{search_text}' or code LIKE '#{search_text}')
              LIMIT #{pager.per_page} OFFSET #{pager.offset}"
        sql1="select id, code, name, quantity, price, time
            from  (select product_id, count(product_id) as quantity, min(created_at) as time, min(imported_price) as price
                  from articles
                  where status = 'exist'
                  group by product_id) article
                  inner join products 
                  on products.id = article.product_id
            WHERE (name LIKE '#{search_text}' or code LIKE '#{search_text}')"

        @ketqua = ActiveRecord::Base.connection.execute(sql).to_a
        @total = ActiveRecord::Base.connection.execute(sql1).to_a.count
  		end
  	end
  	else 
  			sql3="select id, code, name, quantity, price, time
                from	(select product_id, count(product_id) as quantity, min(created_at) as time, min(imported_price) as price
  	                  from articles
  	                  where status = 'exist'
  	                  group by product_id) article
                      inner join products 
                      on products.id = article.product_id
                      WHERE (name LIKE '#{search_text}' or code LIKE '#{search_text}')"
  		  @ketqua = Article.connection.select_all(sql3).to_a
  	end
  	
		if search_text.blank?
			sql4="SELECT 
							created_at
						FROM 
							articles 
						GROUP BY 
							product_id, imported_price, created_at"

		  @total = Article.connection.select_all(sql4).to_a.count
		end

		return @ketqua, @total
  end
  
end 
    