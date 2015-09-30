require 'spec_helper'
require_relative '../../../../apps/admin/views/categories/update'

describe Admin::Views::Categories::Update do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/categories/update.html.erb') }
  let(:view)      { Admin::Views::Categories::Update.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
