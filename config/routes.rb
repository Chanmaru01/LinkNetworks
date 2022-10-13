Rails.application.routes.draw do

  resources :tweets
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  post 'tweets' => 'tweets#create'
  
  get "users/show" => "users#show"

  
  root to: "tweets#index"
  root to: "home#index"
end
