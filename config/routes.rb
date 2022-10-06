Rails.application.routes.draw do

  resources :tweets
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/show" => "users#show"

  get 'tweets/index' => 'tweets#index'
  get 'tweets/:id' => 'tweets#show'
  get 'tweets/new' => 'tweets#new'
  post 'tweets' => 'tweets#create'
  patch 'tweets/:id' => 'tweets#update'
  delete 'tweets/:id' => 'tweets#destroy'
  get 'tweets/:id/edit' => 'tweets#edit'
  
  root to: "tweets#index"
  root to: "home#index"
end
