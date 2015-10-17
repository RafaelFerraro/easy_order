Lotus::Model.migration do
  change do
    alter_table :sub_categories do
      add_column :created_at, Time, null: false
      add_column :updated_at, Time, null: false
    end
  end
end
