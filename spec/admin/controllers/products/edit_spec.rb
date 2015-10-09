require 'spec_helper'

describe Admin::Controllers::Products::Edit do
  let(:action) { described_class.new }

  context 'when product is found' do
    let(:params) { Hash[id: '1'] }
    let(:product) { OpenStruct.new(id: '1', title: 'product') }
    let(:sub_categories) { [OpenStruct.new(id: '1', name: 'sub_category_one'), OpenStruct.new(id: '2', name: 'sub_category_two')] }

    before do
      allow(ProductRepository).to receive(:find).and_return(product)
      allow(SubCategoryRepository).to receive(:all).and_return(sub_categories)
    end

    it 'returns a 200 status code' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end

    it 'exposes a product object' do
      action.call(params)
      expect(action.exposures[:product]).to eq(product)
    end

    it 'exposes a list of sub_categories' do
      action.call(params)
      expect(action.exposures[:sub_categories]).to eq(sub_categories)
    end
  end

  context 'when product is not found' do
    let(:params) { Hash[id: '0'] }

    before do
      allow(ProductRepository).to receive(:find)
    end

    it 'returns a 400 status code' do
      response = action.call(params)
      expect(response[0]).to eq(400)
    end

    it 'returns an error message' do
      response = action.call(params)
      expect(response[2]).to_not be_empty
    end

    it 'doesnt fetch any SubCategory' do
      expect(SubCategoryRepository).to_not receive(:all)
      action.call(params)
    end
  end
end