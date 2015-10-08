class Product
  include Lotus::Entity

  attributes :title, :description, :size, :color, :quantity, :sale_price, :purchase_price, :sub_category_id
end