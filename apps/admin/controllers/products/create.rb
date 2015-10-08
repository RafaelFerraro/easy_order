module Admin::Controllers::Products
  class Create
    include Admin::Action

    params do
      param :product do
        param :title, presence: true
        param :description, presence: true
        param :color, presence: true
        param :size, presence: true
        param :quantity, presence: true
        param :purchase_price, presence: true
        param :sale_price, presence: true
        param :sub_category_id, presence: true
      end
    end

    expose :product, :sub_categories

    def call(params)
      if params.valid?
        @product = ProductRepository.create(Product.new(params[:product]))
        redirect_to routes.products_path
      else
        @sub_categories = SubCategoryRepository.all
      end
    end
  end
end