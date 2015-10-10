require_relative 'view_helper'

module Admin::Views::Products
  class Update
    include Admin::View
    include ViewHelper
    template 'products/edit'
  end
end