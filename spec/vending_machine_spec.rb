require './lib/vending_machine.rb'

describe VendingMachine do
  let(:order){ double(:order, :products => {coke: [200, 2]}) }
  subject(:vending_machine) { described_class.new(order) }

  context '#products' do
    it 'should contain products' do
      expect(vending_machine.products[:coke]).to eq [200, 2]
    end
  end

  context '#top_up' do
    it "top up in 10 £1's" do
      vending_machine.top_up(100, 10)
      expect(vending_machine.coins[100]).to eq 10
    end
  end

  context '#add_product' do
    it "adds a new product" do
      vending_machine.add_product(:snickers, 100, 4)
      expect(vending_machine.products).to have_key :snickers
    end
  end

  context '#choose_item' do
    it "gives the right change" do
      vending_machine.top_up(50, 3)
      vending_machine.top_up(10, 3)
      allow(order).to receive(:purchase).and_return(vending_machine.products)
      vending_machine.choose_item(:coke, 260)
      expect(vending_machine.coins[50]).to eq 2
      expect(vending_machine.coins[10]).to eq 2
    end
    it "gives the right change" do
      allow(order).to receive(:purchase).and_return(vending_machine.products[:coke][1] = 1)
      vending_machine.choose_item(:coke, 260)
      expect(vending_machine.products[:coke][1]).to eq 1
    end
    it "changes total sum in the machine" do
      vending_machine.top_up(10, 6)
      allow(order).to receive(:purchase).and_return(vending_machine.products[:coke][1] = 1)
      vending_machine.choose_item(:coke, 260)
      expect(vending_machine.total_sum).to eq 50
    end
  end

end
