require 'spec_helper'

describe Admin::Views::SubCategories::Update do
  it 'sets a default template' do
    expect(described_class.template).to eq('sub_categories/edit')
  end

  it 'includes the ViewHelper' do
    expect(described_class.include? Admin::Views::SubCategories::ViewHelper).to be_truthy
  end

  context '#instance' do
    let(:template) { Lotus::View::Template.new("apps/admin/templates/sub_categories/edit.html.erb") }
    let(:exposures) { Hash[sub_category: { name: 'sub_category', category_id: 1 }] }
    let(:view)      { described_class.new(template, exposures) }

    it 'responds to selections method' do
      expect(view.respond_to? :selections).to be_truthy
    end
  end
end