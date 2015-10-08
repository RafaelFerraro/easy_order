require 'spec_helper'

describe Admin::Views::Products::Create do
  it { expect(described_class.template).to eq('products/new') }
end