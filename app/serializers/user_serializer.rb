class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :avatar_url, :account
    has_many :comments


    def avatar_url
      rails_blob_path(object.avatar_image) if object.avatar_image.attached?
    end

end