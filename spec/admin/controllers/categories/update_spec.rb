require 'spec_helper'
require_relative '../../../../apps/admin/controllers/categories/update'

describe Admin::Controllers::Categories::Update do
  let(:action) { Admin::Controllers::Categories::Update.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
