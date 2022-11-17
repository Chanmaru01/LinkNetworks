class FavoritesController < ApplicationController
    def create
        @favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @favorite = current_user.favorites.find_by(tweet_id: params[:tweet_id]).destroy
    redirect_back(fallback_location: root_path)
    end

    private

    def clicked_tweet
        Tweet.find(params[:tweet_id])
    end
end
