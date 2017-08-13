require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = products(:one)
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
end
