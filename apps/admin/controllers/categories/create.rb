module Admin::Controllers::Categories
  class Create
    include Admin::Action

    params do
      param :category do
        param :name, presence: true
        param :description, presence: false
      end
    end

    expose :category

    def call(params)
      if params.valid?
        @category = CategoryRepository.create(Category.new(params[:category]))

        redirect_to '/admin/categories'
      end
    end
  end
end
