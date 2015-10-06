module Admin::Controllers::SubCategories
  class Update
    include Admin::Action

    expose :sub_category, :categories

    params do
      param :id
      param :sub_category do
        param :name, presence: true
        param :description, presence: false
        param :category_id, presence: true
      end
    end

    def call(params)
      @sub_category = SubCategoryRepository.find(params[:id])

      if params.valid?
        @sub_category = SubCategory.update(@sub_category, params[:sub_category])

        redirect_to routes.sub_categories_path
      else
        @categories = CategoryRepository.all
      end
    end
  end
end