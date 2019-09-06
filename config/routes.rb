Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root to: 'users#show'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' } 
  resources :users, only: [:show, :index] 
  resources :requests, only: [:index, :create, :update]
end
