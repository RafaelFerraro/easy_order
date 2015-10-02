module Admin::Views::SubCategories
  class New
    include Admin::View

    # TODO: spec
    # TODO: error here when sub is not persisted
    def selections
      hash = {}
      categories.each do |category|
        hash.merge!(merging_fields(category))
      end
      hash
    end

    def merging_fields(category)
      { category.id.to_s => category.name.to_s }
    end
  end
end