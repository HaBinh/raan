require 'test_helper'

class ProductTest < ActiveSupport::TestCase
<<<<<<< HEAD

  def setup
    @product = products(:one)
    @order = Order.create()
  end

  test "name should be present" do
    @product.name = " ";
    assert_not @product.valid?
  end

  test "code should be present" do 
    @product.code = " ";
    assert_not @product.valid?
  end

  test "code should be uniqueness" do
    @same_product = @product.dup
    @same_product.save
    assert_not @same_product.valid?
  end

  test "dependent destroy with order product" do 
    @product.order_products.create(quantity: 1, order_id: @order.id)
    assert_difference 'OrderProduct.count', -1 do 
      @product.destroy
    end
  end
=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> 5f14d4eeeb632f48a1958b8e7ba5803ba3aba648
end
