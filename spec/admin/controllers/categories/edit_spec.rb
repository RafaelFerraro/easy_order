require 'spec_helper'
require_relative '../../../../apps/admin/controllers/categories/edit'

describe Admin::Controllers::Categories::Edit do
  let(:action) { Admin::Controllers::Categories::Edit.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
