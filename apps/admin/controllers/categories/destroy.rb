module Admin::Controllers::Categories
  class Destroy
    include Admin::Action

    expose :category

    def call(params)
      @category = CategoryRepository.find(params[:id])

      if @category
        CategoryRepository.delete(@category)
        redirect_to routes.categories_path
      end
    end
  end
end