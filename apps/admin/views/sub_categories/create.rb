require_relative 'view_helper'

module Admin::Views::SubCategories
  class Create
    include Admin::View
    include ViewHelper
    template "sub_categories/new"
  end
end