class ChangeDatatypeUsersofAccount < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :account, :unique => true
  end
end
