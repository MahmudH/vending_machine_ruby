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
    it 'increase amount of change in the machine' do
      vending_machine.top_up(30)
      expect(vending_machine.total).to eq 50
    end
  end

  context '#choose_item' do
    it 'give change after successful purchase' do
      allow(order).to receive(:purchase).and_return({coke: [2, 1]})
      vending_machine.choose_item(:coke, 3)
      expect(vending_machine.change).to eq 1
    end

    it 'change total' do
      allow(order).to receive(:purchase).and_return({coke: [2, 1]})
      vending_machine.choose_item(:coke, 3)
      expect(vending_machine.total).to eq 22
    end
  end

end