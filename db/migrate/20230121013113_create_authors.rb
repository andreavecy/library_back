class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :followers
      t.text :genres
      t.string :photo
      t.integer :popularity

      t.timestamps
    end
  end
end
