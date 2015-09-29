require 'spec_helper'
require_relative '../../../../apps/admin/views/categories/index'

describe Admin::Views::Categories::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/categories/index.html.erb') }
  let(:view)      { Admin::Views::Categories::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
