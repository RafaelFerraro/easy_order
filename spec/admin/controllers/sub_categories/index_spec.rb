require 'spec_helper'

describe Admin::Controllers::SubCategories::Index do
  let(:params)  { Hash[] }
  let(:action) { Admin::Controllers::SubCategories::Index.new }
  let(:category) { CategoryRepository.create(Category.new(name: "category")) }
  let(:sub_categories) { 
    [
      SubCategoryRepository.create(SubCategory.new(name: 'sub1', category_id: category.id)), 
      SubCategoryRepository.create(SubCategory.new(name: 'sub2', category_id: category.id))
    ] 
  }

  after do
    SubCategoryRepository.clear
    CategoryRepository.clear
  end

  it 'gets all sub_categories from database' do
    expect(SubCategoryRepository).to receive(:all).with(no_args)
    action.call(params)
  end

  it 'exposes a sub_categories attribute' do
    allow(SubCategoryRepository).to receive(:all).and_return(sub_categories)

    action.call(params)
    expect(action.exposures[:sub_categories]).to eq(sub_categories)
  end

  it 'returns a 200 as status code' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end
end