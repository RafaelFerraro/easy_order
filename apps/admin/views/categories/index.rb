module Admin::Views::Categories
  class Index
    include Admin::View

    def new_category_link
      link_to 'New Category', routes.new_category_path
    end

    def edit_link(id)
      link_to 'Edit Category', routes.edit_category_path(id)
    end

    def delete_form(id)
      form_for :category, routes.category_path(id), method: :delete do
        submit 'Delete'
      end
    end

  end
end
