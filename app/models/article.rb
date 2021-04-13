class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :portraits
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

end
