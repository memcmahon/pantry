require './lib/pantry'
require './lib/recipe'
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

  def test_it_start_with_no_shopping_list
    pantry = Pantry.new

    assert_equal({}, pantry.shopping_list)
  end

  def test_it_can_add_a_recipe_to_the_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)


    pantry.add_to_shopping_list(r)

    refute pantry.shopping_list.empty?
    assert_equal({"Cheese" => 20, "Flour" => 20}, pantry.shopping_list)
  end

  def test_it_can_check_items_on_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_equal 20, pantry.shopping_list_check("Cheese")
  end

  def test_it_can_add_multiple_recipes_to_the_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r_2 = Recipe.new("Spaghetti")
    r_2.add_ingredient("Spaghetti Noodles", 10)
    r_2.add_ingredient("Marinara Sauce", 10)
    r_2.add_ingredient("Cheese", 5
    pantry.add_to_shopping_list(r)
    pantry.add_to_shopping_list(r_2)

    assert_equal({"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10})
  end



end
