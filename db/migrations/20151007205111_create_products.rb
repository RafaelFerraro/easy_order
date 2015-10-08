Lotus::Model.migration do
  change do
    create_table :products do
      primary_key :id
      column :title, String, null: false
      column :description, String, null: true
      column :quantity, Integer, null: false
      column :size, String, null: false
      column :color, String, null: false
      column :sale_price, Float, null: false
      column :purchase_price, Float, null: false
      foreign_key :sub_category_id, :sub_categories, on_delete: :cascade, null: false
    end
  end
end