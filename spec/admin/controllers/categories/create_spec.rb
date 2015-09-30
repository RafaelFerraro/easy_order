require 'spec_helper'

describe Admin::Controllers::Categories::Create do
  let(:action)    { described_class.new }
  let(:category)  { CategoryRepository.create(Category.new(name: "category_name", description: "category_description")) }

  before do
    CategoryRepository.clear
  end

  context 'when the request was successful' do
    let(:params)  { { category: { name: "category_name", description: "category_description" } } }
    let(:response) { action.call(params) }

    it 'responds with 302 status' do
      expect(response[0]).to eq(302)
    end

    it 'redirects to admin/categories' do
      expect(response[1]["Location"]).to eq('/admin/categories')
    end

    it 'exposes a category object' do
      allow(CategoryRepository).to receive(:create).and_return(category)
      response
      expect(action.exposures[:category]).to eq(category)
    end

    it 'persists a new category on db' do
      response
      expect(CategoryRepository.all.first.name).to eq('category_name')
      expect(CategoryRepository.all.first.description).to eq('category_description')
    end
  end

  context 'when params are invalids' do
    context 'when name is missing' do
      let(:params)    { { category: { name: nil, description: "some descriptions" } } }
      let(:response)  { action.call(params) }

      it 'returns a 200' do
        expect(response[0]).to eq(200)
      end

      it 'doesnt populates anything on db' do
        response
        expect(CategoryRepository.all.to_a).to be_empty
      end

      it 'doesnt expose a category object' do
        response
        expect(action.exposures[:category]).to be_nil
      end
    end
  end
end
