module Admin::Views::Products
  class New
    include Admin::View

    def sub_categories_select(sub_category=nil)
      result = mount_select_listing(sub_categories)

      if sub_category
        data = { sub_category.id.to_s => sub_category.name }

        result.merge!(data)
      end

      result
    end

    def quantities_select(array)
      mount_select_listing(array)
    end

    private

    def mount_select_listing(array, response=Hash[])
      array.each do |value|
        if value.respond_to? :id
          response.store(value.id.to_s, value.name)
        else
          response.store(value.to_s, value)
        end
      end

      response
    end
  end
end