module Admin::Controllers::SubCategories
  class Edit
    include Admin::Action

    expose :sub_category, :categories

    def call(params)
      @sub_category = SubCategoryRepository.find(params[:id])

      return sub_category_not_found unless @sub_category

      @categories = CategoryRepository.all
    end

    def sub_category_not_found
      status 400, "SubCategory did not found"
    end
  end
end