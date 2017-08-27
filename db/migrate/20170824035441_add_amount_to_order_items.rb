class AddAmountToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :amount, :float
  end
end
