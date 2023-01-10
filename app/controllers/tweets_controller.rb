class TweetsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :create, :favorite]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :update, :destroy, :favorite]
  before_action :set_q, only: [:index, :search]

  # GET /tweets
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.includes(:user).find(params[:id])
    @like = Like.new
    @favorite = Favorite.new
    @comments = @tweet.comments
    @comment = current_user.comments.new

  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path

    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: '投稿が削除されました'
  end

  def search
    @results = @q.result
  end

  def favorite
    @favorite = current_user.favorited_tweets
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end
    
    def set_tweet
      @tweet = current_user.tweets.find_by(id: params[:id])
    end
    # ransackメソッド検索するメソッド
    def set_q
      @q = Tweet.ransack(params[:q])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :image)
    end
end
