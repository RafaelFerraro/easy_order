require 'lotus/model'
Dir["#{ __dir__ }/easy_order/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/easy_order_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/easy_order_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/easy_order_development'
  #    adapter type: :sql, uri: 'mysql://localhost/easy_order_development'
  #
  adapter type: :sql, uri: ENV['EASY_ORDER_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :categories do
      entity Category
      repository CategoryRepository

      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :created_at, Time
      attribute :updated_at, Time
    end

    collection :sub_categories do
      entity SubCategory
      repository SubCategoryRepository

      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :category_id, Integer
      attribute :created_at, Time
      attribute :updated_at, Time
    end

    collection :products do
      entity Product
      repository ProductRepository

      attribute :id, Integer
      attribute :title, String
      attribute :description, String
      attribute :quantity, Integer
      attribute :size, String
      attribute :color, String
      attribute :sale_price, Float
      attribute :purchase_price, Float
      attribute :sub_category_id, Integer
      attribute :created_at, Time
      attribute :updated_at, Time
    end

    collection :photos do
      entity Photo
      repository PhotoRepository

      attribute :id, Integer
      attribute :file_name, String
      attribute :product_id, Integer
    end
  end
end.load!
