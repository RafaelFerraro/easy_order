module Admin::Controllers::SubCategories
  class Destroy
    include Admin::Action

    def call(params)
      @sub_category = SubCategoryRepository.find(params[:id])

      SubCategoryRepository.delete(@sub_category)
      redirect_to routes.sub_categories_path
    end
  end
end