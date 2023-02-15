class HomeController < ApplicationController
    # ログインしていない状態だとログイン画面に飛ばされる
    skip_before_action :authenticate_user!

    def index
        
    end
end
