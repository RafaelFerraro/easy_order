module Admin::Views::Products
  module ViewHelper

    def select_builder(list=nil, current=nil)
      response = Hash[]
      list ||= sub_categories

      hash_builder(list, response)
      
      current ? current.merge!(response) : response
    end

    def hash_builder(list, response)
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