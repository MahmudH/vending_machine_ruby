require './lib/order.rb'

describe Order do
  let(:product){ double(:product, :items => {coke: [2, 2]}) }
  subject(:order) { described_class.new(product) }

  context '#products' do
    it 'should contain products' do
      expect(order.products[:coke]).to eq [2, 2]
    end
  end

  context '#purchase' do
    it 'should decrease quantity of the product' do
      order.purchase(:coke, 3)
      expect(order.products[:coke][1]).to eq 1
    end

    it 'should raise error if there is no stock' do
      order.purchase(:coke, 3)
      order.purchase(:coke, 3)
      expect{ order.purchase(:coke, 3) }.to raise_error "Not in stock"
    end

    it 'should raise error if the money you gave is too little' do
      expect{ order.purchase(:coke, 1) }.to raise_error "Not enough money, please try again"
    end
  end

end
