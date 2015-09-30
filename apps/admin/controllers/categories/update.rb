module Admin::Controllers::Categories
  class Update
    include Admin::Action

    params do
      param :id, presence: true
      param :category do
        param :name, presence: true
        param :description, presence: false
      end
    end

    expose :category

    def call(params)
      @category = CategoryRepository.find(params[:id])

      return status(404, "Category does not found") unless @category

      if params.valid?
        @category = update_category(params[:category])

        redirect_to routes.categories_path
      end
    end

    def update_category(attributes)
      @category.update(attributes)
      CategoryRepository.update(@category)
    end
  end
end
