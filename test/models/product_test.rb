require 'test_helper'

class ProductTest < ActiveSupport::TestCase

def setup
    @category = Category.new(name: "category_name")
  #price should be numerical
    @product1 = Product.new(category: @category, name: "product_name",
    description: "product_description", price: "product_price")
  #price should greater then 0
    @product2 = Product.new(category: @category, name: "product_name",
    description: "product_description", price: -5.0)

end

test "should have the necessary required validators" do
  product = Product.new
  assert_not product.valid?
  assert_equal [:category, :name, :description, :price], product.errors.keys
end

test "price should be numerical" do
    assert_not @product1.valid?
    assert_equal ["nie jest liczbą"], @product1.errors.messages[:price]
  end

test "price should be greater then 0" do
    assert_not @product2.valid?
    assert_equal ["musi być większe od 0.0"], @product2.errors.messages[:price]
    @product2.price = 1.1
    assert @product2.valid?
    assert_equal [], @product2.errors.messages[:price]
  end



end
