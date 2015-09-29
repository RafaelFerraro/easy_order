require 'spec_helper'
require_relative '../../../../apps/web/controllers/categories/create'

describe Web::Controllers::Categories::Create do
  let(:action) { Web::Controllers::Categories::Create.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
