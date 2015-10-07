require 'spec_helper'
require_relative '../../../../apps/admin/views/sub_categories/view_helper'

describe Admin::Views::SubCategories::ViewHelper do
  let(:category_shoes) { CategoryRepository.create(Category.new(name: "shoes")) }
  let(:category_shirts) { CategoryRepository.create(Category.new(name: "shirts")) }

  before do
    category_shoes
    category_shirts
  end

  after do
    CategoryRepository.clear
    SubCategoryRepository.clear
  end

  class Dummy
    include Admin::Views::SubCategories::ViewHelper

    def categories
    end
  end

  describe '.selections' do
    let(:dummy) { Dummy.new }

    before do
      allow(dummy).to receive(:categories).and_return([category_shoes, category_shirts])
    end

    context 'when there is sub_category' do
      let(:current_category)  { CategoryRepository.create(Category.new(name: "current_category")) }
      let(:sub_category)      { SubCategoryRepository.create(SubCategory.new(name: "sub_category", category_id: current_category.id)) }
      let(:response)          { dummy.selections(sub_category) }

      before { response }

      it "returns a hash with all categories, but the current at last position" do
        expect(response).to eq({ category_shoes.id.to_s => "shoes", category_shirts.id.to_s => "shirts", current_category.id.to_s => "current_category" })
      end
    end

    context 'when there is no sub_category' do
      let(:response) { dummy.selections }

      before { response }

      it 'returns a hash with key as id of category and value as name of category' do
        expect(response[category_shoes.id.to_s]).to eq("shoes")
        expect(response[category_shirts.id.to_s]).to eq("shirts")
      end  
    end
  end
end