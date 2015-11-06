module Admin::Views::Products::Photos
  class New
    include Admin::View

    def photos_by_product(product)
      PhotoRepository.photos_by_product(product)
    end
  end
end