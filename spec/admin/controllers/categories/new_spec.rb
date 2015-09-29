require 'spec_helper'
require_relative '../../../../apps/admin/controllers/categories/new'

describe Admin::Controllers::Categories::New do
  let(:action) { Admin::Controllers::Categories::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
