require 'spec_helper'

describe Admin::Controllers::Categories::Edit do
  let(:action)    { described_class.new }
  let(:category) { CategoryRepository.create(Category.new(name: 'category_name', description: 'description_name')) }

  before do
    CategoryRepository.clear
  end

  context 'when category is found' do
    let(:params)    { Hash[id: category.id] }
    let(:response)  { action.call(params) }


    it 'exposes the category' do
      response
      expect(action.exposures[:category]).to eq(category)
    end

    it 'returns a 200 at status' do
      expect(response[0]).to eq(200)
    end
  end

  context 'when category is not found' do
    let(:params) { Hash[id: '1234'] }
    let(:response) { action.call(params) }

    it 'returns a 404 at status code' do
      expect(response[0]).to eq(404)
    end

    it 'returns a message at the body' do
      expect(response[2]).to eq(['Category does not found'])
    end
  end
end
