require 'spec_helper'

describe ProductRepository do
  after do
    ProductRepository.clear
    SubCategoryRepository.clear
    CategoryRepository.clear
  end

  describe '.search' do
    let(:category)         { CategoryRepository.create(Category.new(name: 'shoes', description: 'confortable shoes')) }
    let(:another_category) { CategoryRepository.create(Category.new(name: 'shirt', description: 'unbelievable shirt')) }
    let(:sub_category)      { SubCategoryRepository.create(SubCategory.new(name: 'female shoes', description: 'shoes only for woman', category_id: category.id)) }
    let(:another_sub_category) { SubCategoryRepository.create(SubCategory.new(name: 'female shirt', description: 'shirt only for woman', category_id: another_category.id)) }
    let(:product_one)   { ProductRepository.create(Product.new(title: 'product_one', description: 'description for product_one', size: '42', color: 'black', quantity: 10, sale_price: 100.0, purchase_price: 40.0, sub_category_id: sub_category.id)) }
    let(:product_two)   { ProductRepository.create(Product.new(title: 'product_two', description: 'description for product_two', size: '42', color: 'black', quantity: 10, sale_price: 100.0, purchase_price: 40.0, sub_category_id: sub_category.id)) }
    let(:product_three) { ProductRepository.create(Product.new(title: 'product_three', description: 'description for product_three', size: '42', color: 'black', quantity: 10, sale_price: 100.0, purchase_price: 40.0, sub_category_id: sub_category.id)) }
    let(:product_four)  { ProductRepository.create(Product.new(title: 'product_four', description: 'description for product_four', size: '42', color: 'black', quantity: 10, sale_price: 100.0, purchase_price: 40.0, sub_category_id: another_sub_category.id)) }

    before do
      category
      another_category
      sub_category
      another_sub_category
      product_one
      product_two
      product_three
      product_four
    end

    context 'when searchs is by the product title' do
      let(:query) { 'one' }

      it 'returns only those products that matchs with this query' do
        expect(described_class.search(query)).to eq([product_one.to_h])
      end
    end

    context 'when searchs is by the product description' do
      let(:query) { 'description' }

      it 'returns only those products that matchs with this query' do
        expect(described_class.search(query)).to match_array([product_one.to_h, product_two.to_h, product_three.to_h, product_four.to_h])
      end
    end

    context 'when searchs is by the sub_category name' do
      let(:query) { 'shoes' }

      it 'returns only those products that belongs to that sub_category' do
        expect(described_class.search(query)).to match_array([product_one.to_h, product_two.to_h, product_three.to_h])
      end
    end

    context 'when searchs is by the category name' do
      let(:query) { 'shirt' }

      it 'returns only those products that belongs to that category' do
        expect(described_class.search(query)).to match_array([product_four.to_h])
      end
    end
  end
end