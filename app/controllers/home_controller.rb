class HomeController < ApplicationController
    # ログインしていない状態だとログイン画面に飛ばされる
    # skip_before_action :authenticate_user!

    def index
        redirect_to tweets_path if user_signed_in?
    end
end
