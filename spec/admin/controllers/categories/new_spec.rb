require 'spec_helper'

describe Admin::Controllers::Categories::New do
  let(:action) { Admin::Controllers::Categories::New.new }
  let(:params) { Hash[] }
  let(:response) { action.call(params) }

  it "returns a 200 status code" do
    expect(response[0]).to eq(200)
  end
end
