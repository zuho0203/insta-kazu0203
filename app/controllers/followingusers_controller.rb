class FollowingusersController < ApplicationController
    before_action :authenticate_user!

    def show
      user_ids = current_user.followings.pluck(:id)
      @user = User.where(id: user_ids)
    end
end