class Product
  attr_reader :items

  def initialize
    # @products = Hash.new
    @items = {coke: [2, 5], fanta: [0.8, 3], latte: [3.8, 6]}

  end

  def add_product(name, price, qty)
    details = []
    details.push price, qty
    items[name] = details
  end
end
