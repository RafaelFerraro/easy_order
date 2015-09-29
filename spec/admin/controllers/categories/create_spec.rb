require 'spec_helper'
require_relative '../../../../apps/admin/controllers/categories/create'

describe Admin::Controllers::Categories::Create do
  let(:action) { Admin::Controllers::Categories::Create.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
