require './lib/vending_machine.rb'

describe VendingMachine do
  let(:order){ double(:order, :products => {coke: [2, 2]}) }
  subject(:vending_machine) { described_class.new(order) }

  context '#products' do
    it 'should contain products' do
      expect(vending_machine.products[:coke]).to eq [2, 2]
    end
  end

  context '#add_change' do
    it 'increase amount of change in the machine' do
      vending_machine.add_change(30)
      expect(vending_machine.change).to eq 50
    end
  end

end
