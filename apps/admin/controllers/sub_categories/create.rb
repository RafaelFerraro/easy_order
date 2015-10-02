module Admin::Controllers::SubCategories
  class Create
    include Admin::Action

    params do
      param :sub_category do
        param :name, presence: true
        param :description, presence: false
        param :category_id, presence: true
      end
    end

    expose :sub_category

    def call(params)
      if params.valid?
        @sub_category = SubCategoryRepository.create(SubCategory.new(params[:sub_category]))

        redirect_to routes.sub_categories_path
      end
    end
  end
end