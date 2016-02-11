require_relative 'order'

class VendingMachine

  attr_reader :order, :products, :change, :total

  def initialize(order = Order.new, total_money = 20)
    @order = order
    @products = @order.products
    @total = total_money
  end

  def top_up(amount)
    @total += amount
  end

  def choose_item(item_name, money)
    @order.purchase(item_name, money)
    @total += money
    @change = money - @products[item_name][0]
    @total -= @change
  end

  # private
  # def give_change
  #   @change = money - @products[item_name][0]
  #   @change > 0 ?
  # end


end
