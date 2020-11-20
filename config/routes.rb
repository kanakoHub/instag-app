require 'sidekiq/web'
  
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "snaps#index"

  resources :snaps

  resource :profile, only: [:show, :update]

  namespace :api, defaults: {format: :json} do
    scope '/snaps/:snap_id' do
      resource :like, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
  end

  resources :mysnaps, only: [:index]
end
