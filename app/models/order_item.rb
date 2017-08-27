class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :article
  validates :quantity, numericality: { greater_than: 0 }

  def calculate_amount(price_sale)
    # article = Article.find_by_id(self.article_id)
    # product = Product.find_by_id(article.product_id)
    amount = price_sale * self.quantity
    self.update_attributes(amount: amount)
  end
end
