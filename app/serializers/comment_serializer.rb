class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user
  has_one :profile

end
