require 'spec_helper'

describe Admin::Views::Products::Update do
  it { expect(described_class.include? Admin::Views::Products::ViewHelper).to be_truthy }
  it { expect(described_class.template).to eq('products/edit') }
end