class AddDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :email, "user_placeholder.png"
  end
end
