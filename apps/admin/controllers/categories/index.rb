module Admin::Controllers::Categories
  class Index
    include Admin::Action

    expose :categories

    def call(params)
      @categories = CategoryRepository.all
    end
  end
end
