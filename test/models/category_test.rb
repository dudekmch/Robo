require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'category should has name' do
    category = Category.new
    assert_not category.valid?
    assert_equal [:name], category.errors.keys
  end
  # test "the truth" do
  #   assert true
  # end
end
