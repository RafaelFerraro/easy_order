module Admin::Views::Products
  module ViewHelper
    def sub_categories_select(sub_category=nil)
      if sub_category
        data = { sub_category.id.to_s => sub_category.name }
        merging_with_current(data, mount_base_response(sub_categories))
      else
        mount_base_response(sub_categories)
      end
    end

    def quantities_select(numbers, current=nil)
      if current
        data = { current.to_s => current.to_s }
        merging_with_current(data, mount_base_response(numbers))
      else
        mount_base_response(numbers)
      end
    end

    private

    def merging_with_current(base, increment)
      base.merge!(increment)
    end

    def mount_base_response(list)
      response = {}

      list.each do |value|
        if value.respond_to? :id
          response.store(value.id.to_s, value.name)
        else
          response.store(value.to_s, value.to_s)
        end
      end

      response
    end
  end
end