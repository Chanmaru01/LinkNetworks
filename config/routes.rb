Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  
  
  get "users/show" => "users#show"

  
  root to: "tweets#index"
  root to: "home#index"
end
