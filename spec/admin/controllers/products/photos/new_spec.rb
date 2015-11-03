require 'spec_helper'

describe Admin::Controllers::Products::Photos::New do
  let(:action)        { described_class.new }
  let(:category)      { CategoryRepository.create(Category.new(name: "category")) }
  let(:sub_category)  { SubCategoryRepository.create(SubCategory.new(name: "subcategory", category_id: category.id)) }
  let(:attrs)         { Hash[title: "title", description: "description", size: "M", color: "blue", quantity: 10, sale_price: 50.0, purchase_price: 30.0, sub_category_id: sub_category.id] }
  let(:product)       { ProductRepository.create(Product.new(attrs)) }
  let(:params)        { Hash[product_id: product.id] }

  after do
    CategoryRepository.clear
    SubCategoryRepository.clear
    ProductRepository.clear
  end

  it 'returns a 200 status code' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes the product' do
    action.call(params)
    expect(action.exposures[:product]).to eq(product)
  end
end