module Admin::Controllers::Products
  class Update
    include Admin::Action

    params do
      param :id, presence: true
      param :product do
        param :title, presence: true
        param :description, presence: true
        param :size, presence: true
        param :color, presence: true
        param :purchase_price, presence: true
        param :sale_price, presence: true
        param :sub_category_id, presence: true
      end
    end

    expose :product, :sub_categories

    def call(params)
      @product = ProductRepository.find(params[:id])

      if params.valid?
        Product.update(@product, params[:product].env)
        redirect_to routes.products_path
      else
        @sub_categories = SubCategoryRepository.all
      end
    end
  end
end 