module Admin::Views::SubCategories
  module ViewHelper
    def selections(sub_category=nil)
      hash = {}
      categories.each do |category|
        hash.merge!(merging_fields(category))
      end
      
      sub_category ? current_category(sub_category).merge!(hash) : hash
    end

    private

    def merging_fields(category)
      { category.id.to_s => category.name.to_s }
    end

    def current_category(sub_category)
      { sub_category.category_id.to_s => sub_category.category.name }
    end
  end
end