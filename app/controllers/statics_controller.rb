class StaticsController < ApplicationController
    def top
        @users = User.all
        @tweets = Tweet.all
        @regions = Region.where(ancestry: nil)
        
        
        if user_signed_in?
            @users = current_user
        end
        
        if params[:search] != nil && params[:search] != ''
            #部分検索かつ複数検索
            search = params[:search]
            # @tweets = Tweet.where("name LIKE ? OR people LIKE ? OR seat LIKE ? OR price LIKE ? OR prefecture LIKE ? OR personal LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
            # @tweets = Tweet.joins(:people).where("name LIKE ? OR people LIKE ?", "%#{search}%", "%#{search}%")
            @tweets = Tweet.where("name LIKE ? ",'%' + params[:search] + '%')
            # Tweet.where(カラム名: "検索したい文字列")
        else
            @tweets = Tweet.all
        end

        @tweets = @tweets.page(params[:page]).per(6)
    end
end
