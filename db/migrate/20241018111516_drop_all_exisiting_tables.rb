class DropAllExisitingTables < ActiveRecord::Migration[7.2]
  def change
    drop_table :articles
    drop_table :ckeditor_assets
    drop_table :users
  end
end
