module Admin::Controllers::SubCategories
  class Index
    include Admin::Action

    expose :sub_categories

    def call(params)
      @sub_categories = SubCategoryRepository.all
    end
  end
end