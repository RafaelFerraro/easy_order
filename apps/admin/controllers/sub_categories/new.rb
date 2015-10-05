module Admin::Controllers::SubCategories
  class New
    include Admin::Action

    expose :categories

    def call(params)
      @categories = CategoryRepository.all
    end
  end
end