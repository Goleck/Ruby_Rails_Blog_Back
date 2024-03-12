class RemoveArticleIdFromAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :authors, :article_id, :integer
  end
end
