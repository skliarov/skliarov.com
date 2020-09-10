class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
