class CategoryDiscount < ApplicationRecord
    def self.get_pagination(page, per_page, search_text)
      if page
      WillPaginate::Collection.create(page, per_page) do |pager|
        if search_text.blank?
          sql2="select categories.category, category_discounts.*  from categories 
                join category_discounts
                on category_discounts.id = categories.category_discount_id
				LIMIT #{pager.per_page} OFFSET #{pager.offset}"
          @ketqua = ActiveRecord::Base.connection.execute(sql2).to_a
        else
          search_text = "%#{search_text}%"
          sql="select categories.category, category_discounts.*  from categories 
                join category_discounts
                on category_discounts.id = categories.category_discount_id
              WHERE (category LIKE '#{search_text}')
              LIMIT #{pager.per_page} OFFSET #{pager.offset}"
          sql1="select categories.category, category_discounts.*  from categories 
                join category_discounts
                on category_discounts.id = categories.category_discount_id
              WHERE (category LIKE '#{search_text}')"

          @ketqua = ActiveRecord::Base.connection.execute(sql).to_a
          @total = ActiveRecord::Base.connection.execute(sql1).to_a.count
        end
      end
    else 
  			sql3="select categories.category, category_discounts.*  from categories 
                join category_discounts
                on category_discounts.id = categories.category_discount_id"
  		  @ketqua = ActiveRecord::Base.connection.execute(sql3).to_a
  	end
  	
		if search_text.blank?
			sql4="select categories.category, category_discounts.*  from categories 
                join category_discounts
                on category_discounts.id = categories.category_discount_id"
		  @total = Article.connection.select_all(sql4).to_a.count
		end

		return @ketqua, @total
    end
end
