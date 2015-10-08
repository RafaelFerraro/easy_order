require 'spec_helper'

describe Admin::Controllers::Products::Create do
  let(:action) { described_class.new }

  after do
    ProductRepository.clear
    SubCategoryRepository.clear
  end

  describe 'receiving params' do
    let(:params) { 
      Hash[product: { 
        title: 'title', 
        description: 'description', 
        color: 'color', 
        size: 'size',
        quantity: '5',
        purchase_price: 50.0,
        sale_price: 20.0,
        sub_category_id: '3'
      }] 
    }
    let(:product) { OpenStruct.new(params[:product]) }

    context 'when all params are populateds' do
      it 'returns a 302 status code' do
        allow(ProductRepository).to receive(:create).and_return(product)

        response = action.call(params)
        expect(response[0]).to eq(302)
      end

      it 'exposures a product attr' do
        allow(ProductRepository).to receive(:create).and_return(product)

        action.call(params)
        expect(action.exposures[:product]).to eq(product)
      end

      it 'creates a new Product' do
        expect(ProductRepository).to receive(:create).with(Product.new(params[:product]))
        action.call(params)
      end

      it 'redirects to products listing' do
        allow(ProductRepository).to receive(:create).and_return(product)

        response = action.call(params)
        expect(response[1]['Location']).to eq('/products')
      end
    end

    context '.errors' do
      def self.errors_specs
        it 'returns a 200 status code' do
          response = action.call(params)
          expect(response[0]).to eq(200)
        end

        it 'exposes sub_categories attr' do
          allow(SubCategoryRepository).to receive(:all).and_return(['one', 'two'])

          action.call(params)
          expect(action.exposures[:sub_categories]).to eq(['one', 'two'])
        end

        it 'doesnt creates a Product' do
          expect(ProductRepository).to_not receive(:create)
          action.call(params)
        end
      end

      context 'when title is missing' do
        before { params[:product][:title] = nil }
        errors_specs
      end

      context 'when description is missing' do
        before { params[:product][:description] = nil }
        errors_specs
      end

      context 'when color is missing' do
        before { params[:product][:color] = nil }
        errors_specs
      end

      context 'when size is missing' do
        before { params[:product][:size] = nil }
        errors_specs
      end

      context 'when quantity is missing' do
        before { params[:product][:quantity] = nil }
        errors_specs
      end

      context 'when purchase_price is missing' do
        before { params[:product][:purchase_price] = nil }
        errors_specs
      end

      context 'when sale_price is missing' do
        before { params[:product][:sale_price] = nil }
        errors_specs
      end

      context 'when sub_category_id is missing' do
        before { params[:product][:sub_category_id] = nil }
        errors_specs
      end
    end
  end
end