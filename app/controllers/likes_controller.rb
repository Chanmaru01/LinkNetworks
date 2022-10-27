class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @like = current_user.likes.find_by(tweet_id: params[:tweet_id]).destroy
    redirect_back(fallback_location: root_path)
    end

    private

    def clicked_tweet
        Tweet.find(params[:tweet_id])
    end
end
