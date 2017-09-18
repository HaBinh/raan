class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.string :status
      t.float :amount
      t.timestamps
    end
  end
end
