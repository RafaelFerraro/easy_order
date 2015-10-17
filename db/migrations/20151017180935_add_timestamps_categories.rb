Lotus::Model.migration do
  change do
    alter_table :categories do
      add_column :created_at, Time, null: false, default: Time.now
      add_column :updated_at, Time, null: false, default: Time.now
    end
  end
end
