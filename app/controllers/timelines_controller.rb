class TimelinesController < ApplicationController
before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    @articles = Article.where(user_id: user_ids).where(created_at: 7.days.ago..).includes(:liked_users).sort.reverse {|a,b| b.liked_users.size <=> a.liked_users.size}
  end
end