require 'spec_helper'
require_relative '../../../../apps/admin/controllers/categories/index'

describe Admin::Controllers::Categories::Index do
  let(:action) { Admin::Controllers::Categories::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
