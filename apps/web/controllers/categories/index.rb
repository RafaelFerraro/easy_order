module Web::Controllers::Categories
  class Index
    include Web::Action

    expose :categories

    def call(params)
      @categories = CategoryRepository.all
    end
  end
end