require_relative 'order'

class VendingMachine

  attr_reader :order, :products, :change

  def initialize(order = Order.new, change = 20)
    @order = order
    @products = @order.products
    @change = change
  end

  def add_change(amount)
    @change += amount
  end


end
