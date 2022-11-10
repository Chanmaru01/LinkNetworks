Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
      
  end

  resources :tweets do
      collection do
        get 'search'
      end
      
    resources :likes, only: [:create, :destroy]
  end

  get "users/show" => "users#show"

  root to: "tweets#index"
end
