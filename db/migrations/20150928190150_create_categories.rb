Lotus::Model.migration do
  change do
    create_table :categories do
      primary_key :id
      column :name, String, null: false
      column :description, String, null: true      
    end
  end
end
