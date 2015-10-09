require 'spec_helper'

describe Admin::Views::Products::Edit do
  it 'includes ViewHelper module' do
    expect(described_class.include? Admin::Views::Products::ViewHelper).to be_truthy
  end
end