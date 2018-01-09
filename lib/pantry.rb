class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock         = {}
    @shopping_list = {}
    @cookbook      = []
  end

  def stock_check(item)
    item_checker(@stock, item)
  end

  def shopping_list_check(item)
    item_checker(@shopping_list, item)
  end

  def item_checker(type, item)
    if type[item].nil?
      0
    else
      type[item]
    end
  end

  def restock(item, amount)
    @stock[item] = stock_check(item) + amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |item, amount|
      @shopping_list[item] = shopping_list_check(item) + amount
    end
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def print_shopping_list
    text = ""
    @shopping_list.each do |item, amount|
      text = text + "* #{item}: #{amount}\n"
    end
    text.chomp
  end

  def what_can_i_make
    recipes_i_can_make.map do |recipe|
      recipe.name
    end
  end

  def recipes_i_can_make
    @cookbook.select do |recipe|
      recipe.ingredients.all? do |ingredient|
        stock_check(ingredient[0]) >= ingredient[1]
      end
    end
  end

  def how_many_can_i_make
    result = recipes_i_can_make.map do |recipe|
      {recipe.name => quantity_count(recipe).min}
    end
    arrayed_hash_cleanup(result)
  end

  def quantity_count(recipe)
    recipe.ingredients.map do |ingredient|
      stock_check(ingredient[0]) / ingredient[1]
    end
  end

  def arrayed_hash_cleanup(collection)
    collection.map do |pair|
      pair.to_a
    end.flatten(1).to_h
  end
end
