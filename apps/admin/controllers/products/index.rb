module Admin::Controllers::Products
  class Index
    include Admin::Action

    expose :products

    def call(params)
      @products = ProductRepository.all
    end
  end
end