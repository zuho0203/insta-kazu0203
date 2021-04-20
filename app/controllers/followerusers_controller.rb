class FollowerusersController < ApplicationController
    before_action :authenticate_user!

    def show
      user_ids = current_user.followers.pluck(:id)
      @user = User.where(id: user_ids)
    end
end