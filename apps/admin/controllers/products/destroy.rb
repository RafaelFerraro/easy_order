module Admin::Controllers::Products 
  class Destroy
    include Admin::Action

    def call(params)
      @product = ProductRepository.find(params[:id])
      ProductRepository.delete(@product)

      redirect_to routes.products_path
    end
  end
end