require 'spec_helper'

describe Admin::Controllers::SubCategories::Destroy do
  let(:action) { described_class.new }
  let(:params) { Hash[id: 'id'] }
  let(:sub_category) { Hash[name: 'name', category_id: 1] }

  it 'loads a SubCategory' do
    allow(SubCategoryRepository).to receive(:delete)
    
    expect(SubCategoryRepository).to receive(:find).with('id')
    action.call(params)
  end

  context 'when a SubCategory is found' do
    before do
      allow(SubCategoryRepository).to receive(:find).and_return(sub_category)
    end

    it 'deletes that sub_category' do
      expect(SubCategoryRepository).to receive(:delete).with({ name: 'name', category_id: 1 })
      action.call(params)
    end

    it 'redirects to sub_categories listing' do
      allow(SubCategoryRepository).to receive(:delete)

      response = action.call(params)
      expect(response[1]['Location']).to eq('/sub_categories')
    end

    it 'returns a 302 status code' do
      allow(SubCategoryRepository).to receive(:delete)

      response = action.call(params)
      expect(response[0]).to eq(302)
    end
  end
end