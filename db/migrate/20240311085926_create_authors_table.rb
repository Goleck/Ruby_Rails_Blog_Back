class CreateAuthorsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :authors_tables do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
