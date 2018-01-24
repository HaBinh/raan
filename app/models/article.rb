module Status
  EXIST = 'exist'
  SOLD = 'sold'
end
class Article < ApplicationRecord
  belongs_to :product

  def beSold(order_item_id)
	update_attributes(status: Status::SOLD, order_item_id: order_item_id)
  end

  def beReturn
	update_attributes(status: Status::EXIST, order_item_id: nil)
  end

  def self.get_pagination(search_text, page, per_page)
		if page
			WillPaginate::Collection.create(page, per_page) do |pager|
			unless search_text.nil? || search_text.blank?
			  search_text = "%#{search_text}%"
			  sql="SELECT 
								id, code, name, imported_price, time, quantity, sold
							FROM(
									SELECT 
										article1.product_id, article1.imported_price, article1.created_at as time, article1.quantity, article2.sold
									FROM(
										SELECT 
											product_id, imported_price, created_at, Count(product_id) AS quantity 
										FROM 
											articles
										GROUP BY 
											product_id, imported_price, created_at
										)
											article1 LEFT JOIN
										(
										SELECT 
											product_id, imported_price, created_at, Count(product_id) AS sold 
										FROM 
											articles 
										WHERE status='sold' 
										GROUP BY 
											product_id, imported_price, created_at
										) article2 ON article1.created_at = article2.created_at
									) article
							LEFT JOIN products
							ON   product_id = id
							WHERE (name LIKE '#{search_text}' or code LIKE '#{search_text}')
							LIMIT #{pager.per_page} OFFSET #{pager.offset}"

					sql1 ="SELECT 
								id, code, name, imported_price, time, quantity, sold
							FROM(
									SELECT 
										article1.product_id, article1.imported_price, article1.created_at as time, article1.quantity, article2.sold
									FROM(
										SELECT 
											product_id, imported_price, created_at, Count(product_id) AS quantity 
										FROM 
											articles 
										GROUP BY 
											product_id, imported_price, created_at
										)
											article1 LEFT JOIN
										(
										SELECT 
											product_id, imported_price, created_at, Count(product_id) AS sold 
										FROM 
											articles 
										WHERE status='sold' 
										GROUP BY 
											product_id, imported_price, created_at
										) article2 ON article1.created_at = article2.created_at
									) article
							LEFT JOIN products
							ON   product_id = id
							WHERE (name LIKE '#{search_text}' or code LIKE '#{search_text}')"

					@ketqua = Article.connection.select_all(sql).to_a
		  		@total = Article.connection.select_all(sql1).to_a.count
			else
				sql2="SELECT 
								id, code, name, imported_price, time, quantity, sold
							FROM(
									SELECT 
										article1.product_id, article1.imported_price, article1.created_at as time, article1.quantity, article2.sold
									FROM(
										SELECT 
											product_id, imported_price, created_at, Count(created_at) AS quantity 
										FROM 
											articles 
										GROUP BY 
											product_id, imported_price, created_at
										)
											article1 LEFT JOIN
										(
										SELECT 
											product_id, imported_price, created_at, Count(created_at) AS sold 
										FROM
											articles 
										WHERE status='sold' 
										GROUP BY 
											product_id, imported_price, created_at
										) article2 ON article1.created_at = article2.created_at
									) article
							LEFT JOIN products
							ON   product_id = id
							LIMIT #{pager.per_page} OFFSET #{pager.offset}"
			@ketqua = Article.connection.select_all(sql2).to_a
		end
	end
	else 
			sql3="SELECT 
							created_at
						FROM 
							articles 
						GROUP BY 
							product_id, imported_price, created_at"

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
  