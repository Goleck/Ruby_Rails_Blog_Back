class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :author, null: false 
      t.timestamps
    end
    add_primary_key :authors 
  end
end
