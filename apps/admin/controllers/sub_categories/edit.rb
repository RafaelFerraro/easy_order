module Admin::Controllers::SubCategories
  class Edit
    include Admin::Action

    def call(params)
      @sub_category = SubCategoryRepository.find(params[:id])

      return sub_category_not_found unless @sub_category
    end

    def sub_category_not_found
      status 400, "Sub Category did not found"
    end
  end
end