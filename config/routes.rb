Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
      
  end
  
  resources :tweets do
      collection do
        get 'search'
        get 'favorite'
      end
      
    resources :likes, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  

  get "users/:id" => "users#show"
  
  root to: "tweets#index"
end
