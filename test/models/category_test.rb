require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    # this method runs before every one of our tests
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category name should be present" do
    # test that an empty name CANNOT be created
    @category.name = " "
    assert_not @category.valid?
  end

  test "category should be unique" do
    # test that an empty name CANNOT be created
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
end