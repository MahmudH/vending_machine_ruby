require './lib/product.rb'

describe Product do
  subject(:product) { described_class.new }

  context '#add_product' do
    it 'add a product with name and price' do
      product.add_product(:coke, 2, 4)
      expect(product.items[:coke]).to eql [2, 4]
    end
  end
end
