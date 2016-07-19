class ChangeTableName < ActiveRecord::Migration[5.0]
  def change
     rename_table :game_type, :genre
     drop_table :game_type_games
     create_join_table :games, :genre
  end
end
