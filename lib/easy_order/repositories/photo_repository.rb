class PhotoRepository
  include Lotus::Repository

  def self.photos_by_product(product)
    query do
      where(product_id: product.id)
    end
  end
end