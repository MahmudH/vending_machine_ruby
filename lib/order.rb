require_relative 'product'

class Order

  attr_reader :products

  def initialize(product= Product.new)
    @products = product.items
  end

  def purchase(item_name, money)
    raise 'Not in stock' unless @products[item_name][1] > 0
    raise 'Not enough money, please try again' unless money >= @products[item_name][0]
    # @change = money - @products[item_name][0]
    @products[item_name][1] -= 1
    "Thank you for buying a #{item_name}, enjoy!"
  end

end
