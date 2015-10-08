require 'spec_helper'

describe Admin::Controllers::Products::New do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'returns a 200 status code' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposures a sub_categories attr' do
    allow(SubCategoryRepository).to receive(:all).and_return(['list'])

    action.call(params)
    expect(action.exposures[:sub_categories]).to eq(['list'])
  end

  it 'fetch all SubCategories' do
    expect(SubCategoryRepository).to receive(:all)
    action.call(params)
  end
end