require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_starts_empty
    pantry = Pantry.new

    assert_equal({}, pantry.stock)
  end

  def test_it_can_count_specific_items
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("cheese")
  end

  def test_it_can_restock_specific_items_with_amounts
    pantry = Pantry.new

    assert_equal 10, pantry.restock("Cheese", 10)
    assert_equal 30, pantry.restock("Cheese", 20)
  end

end
