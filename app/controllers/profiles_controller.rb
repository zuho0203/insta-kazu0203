class ProfilesController < ApplicationController
    def show
        @account = current_user.account
    end

    def edit
        @profile = current_user.prepare_profile
    end

    private
    def profile_params
        params.require(:profile).permit(
            :nickname,
            :introduction,
            :gender,
            :birthday,
            :subscribed,
            :avatar

        )
    end
end