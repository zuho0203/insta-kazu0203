class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user

    validates :content, presence: true
    validates :content, length: { minimum: 1, maximum: 70 }

    # after_create :send_email

    private
    def send_email
        TocommentMailer.comment_reply(user).deliver_later
    end

end
