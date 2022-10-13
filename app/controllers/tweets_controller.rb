class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :update, :destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.includes(:user).find(params[:id])
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
      redirect_to @tweet, notice: '新規投稿が作成されました'
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: '更新されました'
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: '投稿が削除されました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
end
