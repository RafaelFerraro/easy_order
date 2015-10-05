require 'spec_helper'

describe Admin::Controllers::SubCategories::New do
  let(:action) { described_class.new }
  let(:params)  { Hash[] }

  before do
    CategoryRepository.create(Category.new(name: "first"))
    CategoryRepository.create(Category.new(name: "second"))
  end

  after do
    CategoryRepository.clear
  end

  it 'exposes a list of categories' do
    response = action.call(params)
    expect(action.exposures[:categories].length).to eq(2)
  end

  it 'sets 200 as code status' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'gets all categories from repository' do
    expect(CategoryRepository).to receive(:all).with(no_args)
    action.call(params)
  end

end