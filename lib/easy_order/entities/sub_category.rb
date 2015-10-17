class SubCategory
  include Lotus::Entity

  attributes :name, :description, :category_id, :created_at, :updated_at

  def category
    CategoryRepository.find(self.category_id)
  end

  def self.update(sub_category, attributes)
    sub_category.update(attributes)
    SubCategoryRepository.update(sub_category)
  end
end