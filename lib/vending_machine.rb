require_relative 'order'

class VendingMachine

  attr_reader :order, :products, :change, :total, :coins

  def initialize(order = Order.new)
    @order = order
    @products = @order.products
    # @total = total_money
    @coins = { 200 => 0, 100 => 0, 50 => 0, 20 => 0,
               10 => 0, 5 => 0, 2 => 0, 1 => 0 }
  end

  def top_up(coin, amount)
    @coins[coin] = @coins[coin] + amount
  end

  # def remove(coin, amount)
  #   (@coins[coin] = @coins[coin] - amount) if @coins[coin] >= amount
  # end

  def machine_sum
    coins.inject(0) { |result, (key, value)| result += (key * value) }
  end

  def choose_item(item_name, money)
    @order.purchase(item_name, money)
    # @total += money
    @change = money - @products[item_name][0]
    # @total -= @change
    @coins.each do |key, value|
      if @change == key
        (@coins[key] = @coins[key] - 1) if @coins[key] >= 1
      end
    end
  end


end
