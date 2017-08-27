class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :quantity
      t.float   :price_sale
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
