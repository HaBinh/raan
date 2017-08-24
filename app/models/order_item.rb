class OrderItem < ApplicationRecord
  # before_save :calculate_amount
  belongs_to :order
  belongs_to :article
  validates :quantity, numericality: { greater_than: 0 }

  private

  def calculate_amount
    article = Article.find_by_id(self.article_id)
    product = Product.find_by_id(article.product_id)
    ammount = product.price_sale.to_f * self.quantity
    self.update_attributes(ammount: ammount)
  end
end
