require 'spec_helper'

describe SubCategory do
  let(:category) { CategoryRepository.create(Category.new(name: 'test')) }
  let(:sub_category) { SubCategoryRepository.create(SubCategory.new(name: 'subtest', category_id: category.id)) }

  after do
    CategoryRepository.clear
    SubCategoryRepository.clear
  end

  describe '#category' do
    it 'returns a Category object' do
      expect(sub_category.category).to eq(category)
    end
  end

  describe '.update' do
    let(:attributes) { Hash[name: 'updated_name'] }

    it 'updates the attributes from sub_category' do
      expect(sub_category).to receive(:update).with({name: "updated_name"})
      described_class.update(sub_category, attributes)
    end

    it 'updates the object sub_category at the repository' do
      expect(SubCategoryRepository).to receive(:update).with(sub_category)
      described_class.update(sub_category, attributes)
    end

    it 'returns an updated sub_category' do
      expect(described_class.update(sub_category, attributes).name).to eq('updated_name')
    end
  end
end