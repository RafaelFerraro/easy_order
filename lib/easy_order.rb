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
    end

    collection :sub_categories do
      entity SubCategory
      repository SubCategoryRepository

      attribute :id, Integer
      attribute :name, String
      attribute :description, String
      attribute :category_id, Integer
    end
  end
end.load!
