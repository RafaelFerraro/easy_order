require_relative 'view_helper'

module Admin::Views::Products
  class Edit
    include Admin::View
    include ViewHelper

    def delete_form(id)
      form_for :product, routes.product_path(id), method: :delete do
        submit "Delete"
      end
    end
  end
end