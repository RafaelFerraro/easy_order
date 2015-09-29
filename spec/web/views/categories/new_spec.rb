require 'spec_helper'
require_relative '../../../../apps/web/views/categories/new'

describe Web::Views::Categories::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/categories/new.html.erb') }
  let(:view)      { Web::Views::Categories::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
