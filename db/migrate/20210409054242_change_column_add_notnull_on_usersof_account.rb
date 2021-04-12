class ChangeColumnAddNotnullOnUsersofAccount < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :account, :string, null: false
  end
end
