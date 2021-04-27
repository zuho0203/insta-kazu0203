class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :portraits
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_rich_text :content
  
  validate :validate_images
  validates :content, length: { minimum: 1, maximum: 140 }
  validates :content, presence: true

  def like_count
    likes.count
  end

  private
  def validate_images
    return if portraits.count <= 5
    errors.add(:portraits, 'You can upload max 5 images')
  end

end
