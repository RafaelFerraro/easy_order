require 'spec_helper'

describe Admin::Controllers::SubCategories::Edit do
  let(:action) { described_class.new }

  context 'when sub_category is found' do
    let(:params) { Hash[id: '007'] }

    before do
      allow(CategoryRepository).to receive(:all).and_return(['first', 'second'])
      allow(SubCategoryRepository).to receive(:find).and_return({ name: 'name', description: 'description' })
    end

    it 'exposures the found category' do
      action.call(params)
      expect(action.exposures[:sub_category]).to eq({ name: 'name', description: 'description' })
    end

    it 'exposures a list of all categories' do
      action.call(params)
      expect(action.exposures[:categories]).to eq(['first', 'second'])
    end

    it 'returns a 200 status code' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end

  context 'when sub_category is not found' do
    let(:params) { Hash[id: '007'] }

    before do
      allow(SubCategoryRepository).to receive(:create).and_return(nil)
    end

    it 'returns 400 as status code' do
      response = action.call(params)
      expect(response[0]).to eq(400)
    end

    it 'returns an error message' do
      response = action.call(params)
      expect(response[2]).to eq(['SubCategory did not found'])
    end

    it 'does not searchs by categories' do
      expect(CategoryRepository).to_not receive(:all)
      action.call(params)
    end
  end
end