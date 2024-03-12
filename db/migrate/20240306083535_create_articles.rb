class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :author, null: true
      t.references :category, null: true
      t.timestamps
    end
  end
end
