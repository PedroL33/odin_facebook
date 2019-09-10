Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root to: 'static_pages#home'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' } 
  resources :users, only: [:show, :index] do
    resources :friends, only: [:index]
  end
  
  resources :requests, only: [:index, :create, :update]
  resources :posts, only: [:indes, :create, :destroy]
  resources :likes, only: [:create]
  resources :comments, only: [:create, :destroy]
end
