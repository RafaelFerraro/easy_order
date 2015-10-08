require 'spec_helper'

describe Admin::Controllers::Products::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'returns a 200 status code' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposures a list of Products' do
    allow(ProductRepository).to receive(:all).and_return(['shoes', 't-shirts'])

    action.call(params)
    expect(action.exposures[:products]).to eq(['shoes', 't-shirts'])
  end

  it 'gets all Products on repository' do
    expect(ProductRepository).to receive(:all).with(no_args)
    action.call(params)
  end
end