class Category < ApplicationRecord
  has_many :products
    def self.get_pagination(page, per_page, search_text)
      
      if page.presence
        @ketqua = Category.paginate(:page => page, :per_page => per_page)
      end

      @ketqua = Category.all

		return @ketqua, @total
    end
end
