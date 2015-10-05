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

    it 'returns a hash with key as id of category and value as name of category' do
      expect(dummy.selections[category_shoes.id.to_s]).to eq("shoes")
      expect(dummy.selections[category_shirts.id.to_s]).to eq("shirts")
    end
  end
end