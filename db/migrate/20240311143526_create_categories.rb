class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false  # Nom de la catégorie (obligatoire)
      t.timestamps
    end
    add_primary_key :categories  # Ajouter une clé primaire auto-incrémentée
  end
end