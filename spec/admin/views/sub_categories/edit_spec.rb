require 'spec_helper'

describe Admin::Views::SubCategories::Edit do
  it 'includes ViewHelper' do
    expect(described_class.include? Admin::Views::SubCategories::ViewHelper).to be_truthy
  end
end