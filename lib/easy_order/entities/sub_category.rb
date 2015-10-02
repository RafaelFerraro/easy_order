class SubCategory
  include Lotus::Entity

  attributes :name, :description, :category_id

  def category
    CategoryRepository.find(self.category_id)
  end
end