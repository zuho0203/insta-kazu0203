class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user

    validates :content, presence: true

    # after_create :send_email

    private
    def send_email
        TocommentMailer.send_comment_reply(user).deliver_later
    end

end
