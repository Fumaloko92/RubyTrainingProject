class FixGenreJoinTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :games_genre, :games_genres
  end
end
