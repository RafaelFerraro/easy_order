module Admin::Controllers::Products::Photos
  class New
    include Admin::Action

    expose :product

    def call(params)
      @product = ProductRepository.find(params[:product_id])
    end
  end
end