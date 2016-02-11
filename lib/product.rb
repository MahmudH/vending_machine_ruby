class Product
  attr_reader :products

  def initialize
    @products = Hash.new
  end

  def add_product(name, price, qty)
    details = []
    details.push price, qty
    products[name] = details
  end
end
