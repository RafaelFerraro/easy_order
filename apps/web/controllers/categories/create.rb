module Web::Controllers::Categories
  class Create
    include Web::Action

    expose :category

    params do
      param :category do
        param :name, presence: true
        param :description, presence: false
      end
    end

    def call(params)
      if params.valid?
        @category = CategoryRepository.create(Category.new(params[:category]))

        redirect_to routes.categories_path
      end
    end
  end
end
