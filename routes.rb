require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'store#index', as: :store_root
  end

  root to: 'visitors#index'

  resources :ovens do
    resource :batch_cookies
    member do
      post :empty
      get :check_status
    end
  end

  resources :orders, only: [:index]

  namespace :api do
    resources :orders, only: [:index] do
      patch :update, on: :member
    end
  end

  mount Sidekiq::Web => '/sidekiq'
  # mount MailPreview => 'mail_view' if Rails.env.development?
end
