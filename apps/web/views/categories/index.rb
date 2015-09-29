module Web::Views::Categories
  class Index
    include Web::View

    def categories_list
      categories
    end
  end
end