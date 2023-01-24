class CreateLends < ActiveRecord::Migration[7.0]
  def change
    create_table :lends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :lend_date

      t.timestamps
    end
  end
end
