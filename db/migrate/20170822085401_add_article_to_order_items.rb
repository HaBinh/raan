class AddArticleToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :article, foreign_key: true
  end
end
