
class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock         = {}
    @shopping_list = {}
    @cookbook      = []
  end

  def stock
    @stock
  end

  def stock_check(item)
    if @stock[item].nil?
      0
    else
      @stock[item]
    end
  end

  def restock(item, amount)
    @stock[item] = stock_check(item) + amount
  end

  def shopping_list_check(item)
    if @shopping_list[item].nil?
      0
    else
      @shopping_list[item]
    end
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |item, amount|
      @shopping_list[item] = shopping_list_check(item) + amount
    end
  end

  def print_shopping_list
    text = ""
    @shopping_list.each do |item, amount|
      text = text + "* #{item}: #{amount}\n"
    end
    text.chomp
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def what_can_i_make
    recipes_i_can_make.map do |recipe|
      recipe.name
    end
  end

  def how_many_can_i_make
    recipes = what_can_i_make.map do |recipe_name|
      @cookbook.select do |recipe|
        recipe.name == recipe_name
      end
    end
  end

  def recipes_i_can_make
    @cookbook.select do |recipe|
      recipe.ingredients.all? do |ingredient|
        stock_check(ingredient[0]) >= ingredient[1]
      end
    end
  end
end
