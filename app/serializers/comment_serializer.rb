class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user

  class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :avatar_url, :account

    def avatar_url
      url_for(object.avatar_image) if object.avatar_image.attached?
    end

end

end
