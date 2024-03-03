class UsersController < ApplicationController
    before_action :authenticate_user!, :only => [:show]

    def show
        @user = User.find(params[:id]) 
        # @events = current_user.events
        @events = @user.events
        @events = @events.page(params[:events_page]).per(5)
        @users = User.all
        # @tweets = Tweet.all

        likes= Like.where(user_id: @user.id).pluck(:tweet_id)
        @like_posts = Tweet.find(likes)
        @like_posts = Kaminari.paginate_array(@like_posts).page(params[:like_posts_page]).per(5)

        # @tweets = current_user.tweets
        @tweets = @user.tweets
        @tweets = @tweets.page(params[:tweets_page]).per(5)
        # @groups = current_user.groups.page(params[:page]).per(5)
    end
end
