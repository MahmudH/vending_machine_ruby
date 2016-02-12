class Product
  attr_reader :items

  def initialize
    # @products = Hash.new
    @items = {coke: [200, 5], fanta: [100, 3], latte: [50, 6]}

  end
end
