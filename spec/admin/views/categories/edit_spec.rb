require 'spec_helper'
require_relative '../../../../apps/admin/views/categories/edit'

describe Admin::Views::Categories::Edit do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/categories/edit.html.erb') }
  let(:view)      { Admin::Views::Categories::Edit.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
