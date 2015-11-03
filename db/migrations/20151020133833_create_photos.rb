Lotus::Model.migration do
  change do
    create_table :photos do
      primary_key :id
      column :file_name, String, null: false
      foreign_key :product_id, :products, on_delete: :cascade, null: false
    end
  end
end