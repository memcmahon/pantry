
class Pantry
  attr_reader :stock,
              :shopping_list

  def initialize
    @stock         = {}
    @shopping_list = {}
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
end
