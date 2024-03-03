class LayoutsController < ApplicationController
    def application
        @users = User.all

        if user_signed_in?
            @current_user = current_user
        end
    end
end
