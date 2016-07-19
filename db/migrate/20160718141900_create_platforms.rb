class CreatePlatforms < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :platform, :integer
    create_table :platforms do |t|
      t.string :name, null: false
      t.string :cpu_if_applicable, default: ""
      t.string :ram_if_applicable, default: ""
      t.string :video_if_applicable, default: ""
      t.string :memory_if_applicable, default: ""
    end
    
    add_reference :platforms, :game, foreign_key: true
  end
end
