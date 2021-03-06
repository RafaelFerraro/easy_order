class Product
  include Lotus::Entity

  attributes :title, :description, :size, :color, :quantity, :sale_price, :purchase_price, :sub_category_id, :created_at, :updated_at

  def self.update(product, attributes)
    product.update(attributes)
    ProductRepository.update(product)
  end
end