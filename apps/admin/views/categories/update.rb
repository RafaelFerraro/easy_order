module Admin::Views::Categories
  class Update
    include Admin::View
    template 'categories/edit'

    def update_category_url
      routes.category_path(params[:id])
    end
  end
end
