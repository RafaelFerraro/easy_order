require 'spec_helper'
require_relative '../../../../apps/web/views/categories/create'

describe Web::Views::Categories::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/categories/create.html.erb') }
  let(:view)      { Web::Views::Categories::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
