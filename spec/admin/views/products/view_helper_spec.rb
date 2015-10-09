require 'spec_helper'

describe Admin::Views::Products::ViewHelper do
  let(:sub_category)   { OpenStruct.new(id: 3, name: 'sub_category') }

  class View
    include Admin::Views::Products::ViewHelper

    # stub
    def sub_categories
      [OpenStruct.new(id: 1, name: 'first'), OpenStruct.new(id: 2, name: 'second')]
    end
  end
  
  describe '#select_builder' do
    let(:view) { View.new }

    context 'when nothing is passed' do
      it 'returns a hash with values from sub_categories objects' do
        expect(view.select_builder).to eq({ '1' => 'first', '2' => 'second' })
      end
    end

    context 'when only a list is passed' do
      let(:numbers) { [0, 1, 2, 3] }

      it 'returns a hash with the values in the list' do
        expect(view.select_builder(numbers)).to eq({ '0' => '0', '1' => '1', '2' => '2', '3' => '3' })
      end
    end

    context 'when only a current value is passed' do
      let(:current) { Hash['5' => 'current'] }

      it 'returns an hash with the values from sub_categories objects and include the current value' do
        expect(view.select_builder(nil, current)).to eq({ '1' => 'first', '2' => 'second', '5' => 'current' })
      end
    end

    context 'when both value is passed' do
      let(:numbers) { [0, 1, 2, 3] }
      let(:current) { Hash['5' => '5'] }

      it 'returns a hash with value into the listing and include the current value' do
        expect(view.select_builder(numbers, current)).to eq({ '0' => '0', '1' => '1', '2' => '2', '3' => '3', '5' => '5' })
      end
    end
  end
end