require 'spec_helper'

describe Admin::Views::SubCategories::Update do
  it 'sets a default template' do
    expect(described_class.template).to eq('sub_categories/edit')
  end
end