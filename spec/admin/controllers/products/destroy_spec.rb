require 'spec_helper'

describe Admin::Controllers::Products::Destroy do
  let(:action)  { described_class.new }
  let(:product) { instance_double("Product") }
  let(:params)  { Hash[id: '1234'] }

  it 'finds a Product throught id' do
    allow(ProductRepository).to receive(:delete)
    expect(ProductRepository).to receive(:find).with('1234').and_return(product)
    action.call(params)
  end

  it 'delete a Product' do
    allow(ProductRepository).to receive(:find).and_return(product)
    expect(ProductRepository).to receive(:delete).with(product)
    action.call(params)
  end

  it 'redirects to listing of products' do
    allow(ProductRepository).to receive(:find).and_return(product)
    allow(ProductRepository).to receive(:delete)

    response = action.call(params)
    expect(response[1]['Location']).to eq('/products')
  end

  it 'returns a 302 status code' do
    allow(ProductRepository).to receive(:find).and_return(product)
    allow(ProductRepository).to receive(:delete)

    response = action.call(params)
    expect(response[0]).to eq(302)
  end
end