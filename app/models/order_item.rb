class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :articles

  def calculate_amount(price_sale)
    # article = Article.find_by_id(self.article_id)
    # product = Product.find_by_id(article.product_id)
    amount = price_sale * quantity.to_i * (1 - discounted_rate)
    self.update_attributes(amount: amount)
  end
end
