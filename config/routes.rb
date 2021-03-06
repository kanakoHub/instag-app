require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'snaps#index'

  resources :snaps

  resources :accounts, only: [:show] do
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  scope module: :apps do
    resource :profile, only: %i[show update]
    resource :timeline, only: [:show]
  end

  namespace :api, defaults: { format: :json } do
    scope '/snaps/:snap_id' do
      resource :like, only: %i[create destroy]
      resources :comments, only: [:index, :create]
    end

    scope '/accounts/:account_id' do
      resources :follows, only: [:create]
      resources :unfollows, only: [:create]
    end
  end
end
