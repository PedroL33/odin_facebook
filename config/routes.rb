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

end
