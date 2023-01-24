class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :pages
      t.string :editorial
      t.text :genres
      t.references :author, null: false, foreign_key: true
      t.date :published_date
      t.string :cover
      t.text :resumen

      t.timestamps
    end
  end
end
