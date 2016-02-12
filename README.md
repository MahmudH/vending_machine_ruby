1. Vending Machine

Design a vending machine in code. The vending machine should perform as follows:

- Once an item is selected and the appropriate amount of money is inserted, the vending
machine should return the correct product.

- It should also return change if too much money is provided, or ask for more money if
insufficient funds have been inserted.

- The machine should take an initial load of products and change. The change will be of
denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.

- There should be a way of reloading either products or change at a later point.

- The machine should keep track of the products and change that it contains.

Please develop the machine in any language you are comfortable in.

```
Installation:
git clone repo
cd into repo
bundle
```

In command line tool, start irb to start the vending machine app.

### Follow steps below:

Require the file.
```
2.2.1 :001 > require './lib/vending_machine.rb'
 => true
 ```

Instantiate a variable and create an object of the class.
```
 2.2.1 :002 > vendingmachine = VendingMachine.new
```

You can add a product with 3 arguments. Product name, price and quantity.
```
2.2.1 :003 > vendingmachine.add_product(:snickers, 200, 4)
 => [200, 4]
2.2.1 :004 > vendingmachine.products
 => {:coke=>[200, 5], :fanta=>[100, 3], :latte=>[50, 6], :snickers=>[200, 4]}
```

You can top up with 2 arguments. Coin and quantity of that coin. This increases the total_sum in the vending machine.

```
2.2.1 :005 > vendingmachine.top_up(100, 4)
 => 4
2.2.1 :006 > vendingmachine.top_up(50, 4)
 => 4
2.2.1 :007 > vendingmachine.top_up(10, 4)
 => 4
2.2.1 :008 > vendingmachine.total_sum
 => 640
 ```

 You can choose an item to buy from the vending machine but giving 2 arguments. The product name and the amount you are putting into the vending machine to purchase the item.

 ```
 2.2.1 :009 > vendingmachine.choose_item(:fanta, 160)
 => {200=>0, 100=>4, 50=>3, 20=>0, 10=>3, 5=>0, 2=>0, 1=>0}
2.2.1 :010 > vendingmachine.total_sum
 => 580
 ```

 Purchasing an item decreases the coin hash, which gave back 50p and 10p to the user.The quantity of the product also decreases. Fanta went from 3 to 2. 

 ```
 2.2.1 :011 > vendingmachine.products
 => {:coke=>[200, 5], :fanta=>[100, 2], :latte=>[50, 6], :snickers=>[200, 4]}
 ```

 This app is built with Ruby and RSPec using TDD.

 #### Thank you for viewing.
