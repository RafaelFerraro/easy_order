require 'spec_helper'

describe Admin::Controllers::Products::Update do
  let(:action) { described_class.new }
  let(:product) { double('Product') }
  let(:params) { Hash[
    id: '007',
    product: {
      title: 'product',
      description: 'description for product',
      color: 'blue',
      size: 'G',
      purchase_price: 50.00,
      sale_price: 100.00,
      sub_category_id: 1
    }] }
    
  context 'when params are valids' do

    before { allow(ProductRepository).to receive(:find).and_return(product) }

    it 'returns a 302 status code' do
      allow(Product).to receive(:update)

      response = action.call(params)
      expect(response[0]).to eq(302)
    end

    it 'redirects to listing of Products' do
      allow(Product).to receive(:update)

      response = action.call(params)
      expect(response[1]['Location']).to eq('/products')
    end

    it 'exposes the updated Product' do
      expect(Product).to receive(:update).with(product, params[:product])
      action.call(params)
    end

    it 'doesnt exposes sub_categories' do
      allow(Product).to receive(:update)

      action.call(params)
      expect(action.exposures[:sub_categories]).to be_nil
    end
  end

  context 'invalid_params' do

    def self.errors_spec
      it 'returns a 200 status code' do
        response = action.call(params)
        expect(response[0]).to eq(200)
      end

      it 'exposes a SubCategories list' do
        allow(SubCategoryRepository).to receive(:all).and_return(['sub_one', 'sub_two'])

        action.call(params)
        expect(action.exposures[:sub_categories]).to eq(['sub_one', 'sub_two'])
      end

      it 'exposes a Product' do
        allow(ProductRepository).to receive(:find).and_return({ double: 'double' })

        action.call(params)
        expect(action.exposures[:product]).to eq({ double: 'double' })
      end

      it 'doesnt update the Product' do
        expect(Product).to_not receive(:update)
        expect(ProductRepository).to_not receive(:update)
        action.call(params)
      end
    end

    context 'when title is missing' do
      before { params[:product].delete(:title) }
      errors_spec
    end

    context 'when description is missing' do
      before { params[:product].delete(:description) }
      errors_spec
    end

    context 'when color is missing' do
      before { params[:product].delete(:color) }
      errors_spec
    end

    context 'when size is missing' do
      before { params[:product].delete(:size) }
      errors_spec
    end

    context 'when purchase_price is missing' do
      before { params[:product].delete(:purchase_price) }
      errors_spec
    end

    context 'when sale_price is missing' do
      before { params[:product].delete(:sale_price) }
      errors_spec
    end

    context 'when sub_category_id is missing' do
      before { params[:product].delete(:sub_category_id) }
      errors_spec
    end
  end
end