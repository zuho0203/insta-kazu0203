class ChangeDatatypeUsersofAccount < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :account
    add_index :users, :account, :unique => true
  end
end
