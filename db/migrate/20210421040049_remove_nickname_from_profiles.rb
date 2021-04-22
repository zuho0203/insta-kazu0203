class RemoveNicknameFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :nickname, :string
    remove_column :profiles, :introduction, :text
    remove_column :profiles, :gender, :integer
    remove_column :profiles, :birthday, :date
  end
end
