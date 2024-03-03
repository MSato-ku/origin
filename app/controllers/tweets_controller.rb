class TweetsController < ApplicationController
    def new
        @tweet = Tweet.new
        @tweets = Tweet.all
        @regions = Region.where(ancestry: nil)
    end

    def create
        tweet = Tweet.new(tweet_params)
        # tweet.image = "restaurant-icon.png"
        tweet.user_id = current_user.id
        if tweet.save
            redirect_to user_path(current_user.id)
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        tweet = @tweet.prefecture
        @regions = Region.find(tweet)
        @Tweets = Tweet.where(id: @region)
        @user = User.find(@tweet.user_id) 
    end

    def edit
        @tweet = Tweet.find(params[:id])
        @regions = Region.where(ancestry: nil)
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to user_path(current_user.id)
    end

    private
    def tweet_params
        params.require(:tweet).permit(:prefecture, :people, :seat, :image, :comment, :price, :name, :user_id, :personal, :url)
    end
end
