require 'spec_helper'

describe Admin::Views::Products::New do
  let(:sub_categories) { [OpenStruct.new(id: 1, name: 'first'), OpenStruct.new(id: 2, name: 'second')] }
  let(:template)       { Lotus::View::Template.new('apps/admin/templates/products/new.html.erb') }
  let(:exposures)      { Hash[sub_categories: sub_categories] }
  let(:view)           { described_class.new(template, exposures) }
  
  describe '#sub_categories_select' do
    context 'when there is current sub_category' do
      let(:sub_category) { OpenStruct.new(id: 3, name: 'current') }

      it 'inserts the data of that on last position of hash and return it' do
        expect(view.sub_categories_select(sub_category)).to eq({ '1' => 'first', '2' => 'second', '3' => 'current' })
      end
    end

    context 'when there is no current sub_category' do
      it 'returns only the values from sub_categories attribute' do
        expect(view.sub_categories_select).to eq({ '1' => 'first', '2' => 'second'})
      end
    end
  end

  describe '#quantities_select' do
    it 'returns an array with values' do
      expect(view.quantities_select((0..5))).to eq({ '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5 })
    end
  end
end