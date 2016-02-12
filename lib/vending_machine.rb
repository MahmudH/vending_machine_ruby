require_relative 'order'

class VendingMachine

  attr_reader :order, :products, :change, :total, :coins

  def initialize(order = Order.new)
    @order = order
    @products = @order.products
    @coins = { 200 => 0, 100 => 0, 50 => 0, 20 => 0,
               10 => 0, 5 => 0, 2 => 0, 1 => 0 }
  end

  def add_product(name, price, qty)
    details = []
    details.push price, qty
    @products[name] = details
  end

  def top_up(coin, amount)
    @coins[coin] = @coins[coin] + amount
  end

  def total_sum
    coins.inject(0) { |result, (key, value)| result += (key * value) }
  end

  def choose_item(item_name, money)
    @order.purchase(item_name, money)
    @change = money - @products[item_name][0]
    @coins.each do |key, value|
      if @change == key
        (@coins[key] = @coins[key] - 1) if @coins[key] >= 1
        break
      else
        if (@change - key) > 0
          (@coins[key] = @coins[key] - 1) if @coins[key] >= 1
        end
      end
    end
  end
end
