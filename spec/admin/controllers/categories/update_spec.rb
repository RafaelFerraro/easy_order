require 'spec_helper'

describe Admin::Controllers::Categories::Update do
  let(:action)   { Admin::Controllers::Categories::Update.new }
  let(:category) { CategoryRepository.create(Category.new(name: "categoy_name", description: "category_description")) }

  context 'when any param is missing' do
    context '#id' do
      let(:params) { Hash[category: { name: "categoy_name", description: "category_description" }] }

      it 'returns a 404 at status code' do
        response = action.call(params)
        expect(response[0]).to eq(400)
      end

      it 'returns a message about that error' do
        response = action.call(params)
        expect(response[2]).to eq(['Category did not found'])
      end
    end

    context '#name' do
      let(:params) { Hash[id: category.id, category: { name: nil, description: "category_description" }] }

      it 'returns a 200 at status code' do
        response = action.call(params)
        expect(response[0]).to eq(200)
      end

      it 'returns an empty body' do
        response = action.call(params)
        expect(response[2]).to be_empty
      end

      it 'exposes an error validation to view' do
        response = action.call(params)
        expect(action.exposures[:errors]).to_not be_nil
      end
    end
  end

  context 'when params are valids' do
    let(:params) { Hash[id: category.id, category: { name: "category_name_updated", description: "category_description_updated" }] }

    it 'redirects to categories listing' do
      response = action.call(params)
      expect(response[1]['Location']).to eq("/categories")
    end

    it 'returns a 302 status code' do
      response = action.call(params)
      expect(response[0]).to eq(302)
    end

    context 'updates the attributes of that category' do
      before { action.call(params) }

      it { expect(action.exposures[:category].name).to eq("category_name_updated") }
      it { expect(action.exposures[:category].description).to eq("category_description_updated") }
    end
  end
end
