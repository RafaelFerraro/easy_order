require 'spec_helper'

describe Admin::Controllers::Categories::Index do
  let(:action) { Admin::Controllers::Categories::Index.new }
  let(:params) { Hash[] }
  let(:response) { action.call(params) }

  it "returns a 200 code status" do
    expect(response[0]).to eq(200)
  end

  it 'finds all categories' do
    expect(CategoryRepository).to receive(:all)
    response
  end

  it 'exposes a list of categories' do
    response
    expect(action.exposures[:categories]).to eq([])
  end
end
