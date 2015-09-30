module Admin::Controllers::Categories
  class Edit
    include Admin::Action

    expose :category

    def call(params)
      @category = CategoryRepository.find(params[:id])
      status(404, "Category does not found") unless @category
    end
  end
end
