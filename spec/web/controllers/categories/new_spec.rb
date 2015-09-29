require 'spec_helper'
require_relative '../../../../apps/web/controllers/categories/new'

describe Web::Controllers::Categories::New do
  let(:action) { Web::Controllers::Categories::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
