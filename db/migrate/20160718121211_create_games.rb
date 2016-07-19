class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :game_type do |t|
      t.string :name, uniqueness: true
      
      t.timestamps
    end
    create_table :games do |t|
      t.string :name, uniqueness: true, null: false
      t.string :producer, default: ""
      t.integer :release_year, default: ""
      t.integer :platform, default: 0
      
      t.timestamps
    end
    
    create_join_table :games, :posts
    create_join_table :games, :game_type
    create_join_table :games, :users
  end
end
