class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にメールアドレスのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :email, :pr, :image ])
    # アカウント編集の時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :pr, :image ])
  end

  def after_sign_in_path_for(resource)
    tweets_path
  end
  
end