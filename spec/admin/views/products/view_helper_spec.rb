require 'spec_helper'

describe Admin::Views::Products::ViewHelper do
  let(:sub_categories) { [OpenStruct.new(id: 1, name: 'first'), OpenStruct.new(id: 2, name: 'second')] }

  class View
    include Admin::Views::Products::ViewHelper

    # stub
    def sub_categories
    end
  end
  
  describe '#sub_categories_select' do
    let(:view) { View.new }

    before do
      allow(view).to receive(:sub_categories).and_return(sub_categories)
    end

    context 'when there is current sub_category' do
      let(:sub_category) { OpenStruct.new(id: 3, name: 'current') }

      it 'inserts the data of that on last position of hash and return it' do
        expect(view.sub_categories_select(sub_category)).to eq({ '3' => 'current', '1' => 'first', '2' => 'second' })
      end
    end

    context 'when there is no current sub_category' do
      it 'returns only the values from sub_categories attribute' do
        expect(view.sub_categories_select).to eq({ '1' => 'first', '2' => 'second'})
      end
    end
  end

  describe '#quantities_select' do
    let(:view) { View.new }
    
    context 'when there are a current quantity' do
      it 'returns an hash with current value at the first position' do
        expect(view.quantities_select((0..3), 5)).to eq({ '5' => '5', '0' => '0', '1' => '1', '2' => '2', '3' => '3', })
      end
    end

    context 'when there are no quantity' do
      it 'returns only a hash without a current value' do
        expect(view.quantities_select((0..3))).to eq({ '0' => '0', '1' => '1', '2' => '2', '3' => '3' })
      end
    end
  end
end