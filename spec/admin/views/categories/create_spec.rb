require 'spec_helper'
require_relative '../../../../apps/admin/views/categories/create'

describe Admin::Views::Categories::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/categories/create.html.erb') }
  let(:view)      { Admin::Views::Categories::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
