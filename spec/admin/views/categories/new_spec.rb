require 'spec_helper'
require_relative '../../../../apps/admin/views/categories/new'

describe Admin::Views::Categories::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/categories/new.html.erb') }
  let(:view)      { Admin::Views::Categories::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
