require 'spec_helper'

describe Web::Controllers::Products::Search do
  let(:action) { described_class.new }

  context 'when there are query to search' do
    let(:params) { Hash[query: "test"] }

    it 'searchs by Products with that query' do
      expect(ProductRepository).to receive(:search).with("test")
      action.call(params)
    end

    it 'exposes the products' do
      allow(ProductRepository).to receive(:search).and_return(['resultone', 'resulttwo'])

      action.call(params)
      expect(action.exposures[:products]).to eq(['resultone', 'resulttwo'])
    end

    it 'returns a 200 status code' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end

  context 'when query is not present' do
    let(:params) { Hash[query: ''] }

    it 'gets the most recents products' do
      expect(ProductRepository).to receive(:all).with(no_args)
      action.call(params)
    end

    it 'exposes the products' do
      allow(ProductRepository).to receive(:all).and_return(['first', 'second'])

      action.call(params)
      expect(action.exposures[:products]).to eq(['first', 'second'])
    end

    it 'returns a 200 status code' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end