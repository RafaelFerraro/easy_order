module Admin::Controllers::Products
  class Edit
    include Admin::Action

    expose :product, :sub_categories

    def call(params)
      @product = ProductRepository.find(params[:id])
      return status(400, "Product does not found") unless @product

      @sub_categories = SubCategoryRepository.all
    end
  end
end