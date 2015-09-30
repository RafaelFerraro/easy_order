module Admin::Views::Categories
  class Edit
    include Admin::View

    def update_category_url
      routes.category_path(category.id)
    end
  end
end
