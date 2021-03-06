module Web::Controllers::Products
  class Search
    include Web::Action

    expose :products

    def call(params)
      query = params[:query]

      @products = if query.empty? || query.nil?
        ProductRepository.all
      else
        ProductRepository.search(query)
      end
    end
  end
end