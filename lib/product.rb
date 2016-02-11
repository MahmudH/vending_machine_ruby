class Product
  attr_reader :items

  def initialize
    # @products = Hash.new
    @items = {coke: [200, 5], fanta: [100, 3], latte: [50, 6]}

  end

  def add_product(name, price, qty)
    details = []
    details.push price, qty
    items[name] = details
  end
end
