require 'spec_helper'

describe Admin::Controllers::SubCategories::Update do
  let(:action) { described_class.new }
  let(:category) { CategoryRepository.create(Category.new(name: 'category', description: 'description')) }
  let(:sub_category) { SubCategoryRepository.create(SubCategory.new(name: 'sub_category', description: 'description', category_id: category.id)) }

  after do
    SubCategoryRepository.clear
    CategoryRepository.clear
  end

  context 'when any params is not present or invalid' do
    let(:params) { Hash[id: sub_category.id, sub_category: { name: nil, category_id: nil }] }

    it 'returns a 200 status code' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end

    it 'exposures the categories with a list of those' do
      action.call(params)
      expect(action.exposures[:categories]).to eq([category])
    end

    it 'doesnt update the sub_category' do
      expect(SubCategory).to_not receive(:update)
      action.call(params)
    end

    it 'exposures the sub_category with current attributes' do
      action.call(params)
      expect(action.exposures[:sub_category].name).to eq('sub_category')
    end
  end
  
  context 'when its all ok' do
    let(:params) { Hash[id: sub_category.id, sub_category: { name: 'updated_name', description: 'updated_description', category_id: category.id }]}

    it 'exposures the sub_category' do
      action.call(params)
      expect(action.exposures[:sub_category]).to_not be_nil 
    end

    it 'updates the name of sub_category' do
      action.call(params)
      expect(action.exposures[:sub_category].name).to eq('updated_name')
    end

    it 'updates the description of sub_category' do
      action.call(params)
      expect(action.exposures[:sub_category].description).to eq('updated_description')
    end

    it 'returns a 302 status code' do
      response = action.call(params)
      expect(response[0]).to eq(302)
    end
    
    it 'redirects to sub_categories listing' do
      response = action.call(params)
      expect(response[1]['Location']).to eq('/sub_categories')
    end
  end
end