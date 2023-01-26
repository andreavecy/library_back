class ChangeColumnToArray < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :genres, "varchar[] USING (string_to_array(genres, ','))"
    change_column :authors, :genres, "varchar[] USING (string_to_array(genres, ','))"
  end
end
