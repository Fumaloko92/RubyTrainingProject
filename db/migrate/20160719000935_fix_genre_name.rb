class FixGenreName < ActiveRecord::Migration[5.0]
  def change
    rename_table :genre, :genres
  end
end
