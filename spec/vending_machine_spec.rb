require './lib/vending_machine.rb'

describe VendingMachine do
  let(:order){ double(:order, :products => {coke: [2, 2]}) }
  subject(:vending_machine) { described_class.new(order) }

  context '#products' do
    it 'should contain products' do
      expect(vending_machine.products[:coke]).to eq [2, 2]
    end
  end

  context '#top_up' do
    it "top up in 10 £1's" do
      vending_machine.top_up(100, 10)
      expect(vending_machine.coins[100]).to eq 10
    end
  end

  # context '#remove' do
  #   it "remove 8 £1's" do
  #     vending_machine.top_up(100, 10)
  #     vending_machine.remove(100, 8)
  #     expect(vending_machine.coins[100]).to eq 2
  #   end
  # end

  context '#add_product' do
    it "adds a new product" do
      vending_machine.add_product(:snickers, 100, 4)
      expect(vending_machine.products).to have_key :snickers
    end
  end

  context '#choose_item' do
    it "gives the right change" do
      
      vending_machine.add_product(:snickers, 100, 4)
      expect(vending_machine.products).to have_key :snickers
    end
  end



  # context '#choose_item' do
  #   it 'give change after successful purchase' do
  #     allow(order).to receive(:purchase).and_return({coke: [2, 1]})
  #     vending_machine.choose_item(:coke, 3)
  #     expect(vending_machine.change).to eq 1
  #   end
  #
  #   it 'change total' do
  #     allow(order).to receive(:purchase).and_return({coke: [2, 1]})
  #     vending_machine.choose_item(:coke, 3)
  #     expect(vending_machine.total).to eq 22
  #   end
  # end

end
