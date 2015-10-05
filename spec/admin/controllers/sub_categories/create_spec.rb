require 'spec_helper'

describe Admin::Controllers::SubCategories::Create do
  let(:action) { Admin::Controllers::SubCategories::Create.new }
  let(:category) { CategoryRepository.create(Category.new(name: 'shoes')) }
  let(:sub_category) { SubCategoryRepository.create(SubCategory.new(name: 'female', category_id: category.id)) }

  context 'when params are valids' do
    let(:params) { Hash[sub_category: { name: 'female', category_id: category.id }] }

    before do
      allow(SubCategoryRepository).to receive(:create).and_return(sub_category)
    end

    after do
      CategoryRepository.clear
      SubCategoryRepository.clear
    end

    it 'creates a new subcategory' do
      response = action.call(params)
      expect(action.exposures[:sub_category]).to eq(sub_category)
    end

    it 'returns a 302 status code' do
      response = action.call(params)
      expect(response[0]).to eq(302)
    end

    it 'redirects to sub_categories_path' do
      response = action.call(params)
      expect(response[1]["Location"]).to eq("/sub_categories")
    end
  end

  context 'when params are not valids' do
    let(:category_shoes) { CategoryRepository.create(Category.new(name: 'shoes')) }

    before { category_shoes }
    after  { CategoryRepository.clear }

    let(:params) { Hash[sub_category: { name: nil, category_id: nil }] }

    it 'populates a categories att with all persisted Categories' do
      action.call(params)
      expect(action.exposures[:categories]).to match_array([category_shoes])
    end

    it 'does not populates a sub_category attribute' do
      action.call(params)
      expect(action.exposures[:sub_category]).to be_nil
    end

    it 'status code as 200' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end