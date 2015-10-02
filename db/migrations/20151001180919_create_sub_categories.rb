Lotus::Model.migration do
  change do
    create_table :sub_categories do
      primary_key :id
      column :name, String, null: false
      column :description, String, null: true
      foreign_key :category_id, :categories, on_delete: :cascade, null: false
    end
  end
end
