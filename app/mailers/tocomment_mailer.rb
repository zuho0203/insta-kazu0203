class TocommentMailer < ApplicationMailer
    def comment_reply(user)
        @user = user
        mail to: 'user.email', subject: '【おしらせ】投稿にコメントされました'
    end
end