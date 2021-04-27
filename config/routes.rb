require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resource :timeline, only: [:show]
  resource :followinguser, only: [:show]
  resource :followeruser, only: [:show]


  resources :articles do
    resource :like, only: [:show, :create, :destroy]
    resources :comments, only: [:index, :new, :create, :destroy]
  end

  resource :profile, only: [:show, :edit, :update, :create]

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]

  end
  
end
