class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
     t.string :title, :null => false, :default => ""
     t.text :content, :null => false, :default => ""
     
     t.timestamps
    end
     add_reference :comments, :user, index: true, :null => false
     
     add_reference :comments, :post, index: true, :null => false
  end
end
