require 'spec_helper'

describe Admin::Views::SubCategories::Create do
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/sub_categories/new.html.erb') }
  let(:exposures) { Hash[sub_category: { name: 'name', category_id: '2' }] }
  let(:view)      { described_class.new(template, exposures) }

  it 'includes Admin::View' do
    expect(described_class.include? Admin::View).to be_truthy
  end

  it 'includes ViewHelper' do
    expect(described_class.include? Admin::Views::SubCategories::ViewHelper).to be_truthy
  end

  it 'responds to selections method' do
    expect(view.respond_to? :selections).to be_truthy
  end
end