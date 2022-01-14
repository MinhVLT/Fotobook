Rails.application.routes.draw do
  # namespace :feeds do
  #   get 'albums/discovers/albums'
  # end
  root to: "discovers/photos#index"

  get "/profile", to: "users#show"
  # get "/discover/photos", to: "photos#discover" 
  # get "/discover/albums", to: "albums#discover" 

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users, only: [:show]

  resources :photos, :albums, only: [:new, :create, :edit, :update, :destroy]

  namespace :discovers do
    resources :photos, only: [:index]
    resources :albums, only: [:index]
  end

  namespace :feeds do
    resources :photos, only: [:index]
    resources :albums, only: [:index]
  end
  
  resource :relationships, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
