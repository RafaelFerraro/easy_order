module Admin::Controllers::SubCategories
  class New
    include Admin::Action

    expose :categories

    # TODO: spec
    def call(params)
      @categories = CategoryRepository.all
    end
  end
end