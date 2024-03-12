class AddAuthorIdToArticles < ActiveRecord::Migration[7.1]
  def change
    # add_column :articles, :author_id, :integer
    # add_foreign_key :articles, :authors
    add_reference :articles, :author, null: true, foreign_key: true
  end
end
