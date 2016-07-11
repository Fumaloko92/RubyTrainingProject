class FixDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :email, nil
    change_column_default :users, :avatar, "user_placeholder.png"
  end
end
