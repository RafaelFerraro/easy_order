module Admin::Views::SubCategories
  class Index
    include Admin::View

    def delete_form(id)
      form_for :sub_category, routes.sub_category_path(id), method: :delete do
        submit 'Delete'
      end
    end
  end
end