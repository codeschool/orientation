require_relative "routes/api_constraints"

Rails.application.routes.draw do
  root "guides#index"

  get 'auth/:provider/callback', to: 'sessions#create', as: :oauth_callback
  get 'auth/failure', to: redirect('/')
  get :sign_in, to: "sessions#new", as: :sign_in
  get :sign_out, to: "sessions#destroy", as: :sign_out

  resources :tags

  resources :authors, only: [:index, :show, :new, :create, :update] do
    put :toggle_status, to: "authors#toggle_status", as: :toggle_status
    put :toggle_email_privacy
  end

  resources :articles do
    collection do
      get :fresh
      get :stale
      get :rotten
      get :archived
      get :popular
    end
    member do
      put :toggle_subscription
      put :toggle_endorsement
      put :report_rot
      put :mark_fresh
      put :toggle_archived
      get :subscriptions
    end
  end

  resources :guides, only: [:show, :index]
  resources :subscriptions, only: :index
  resources :endorsements, only: :index

  # this has to be the last route because we're catching slugs at the root path
  resources :articles, only: :show

  namespace :api, defaults: { format: :json } do
    # resources :search, only: :index
    scope module: :v1, constraints: Routes::ApiConstraints.new(version: 1, default: true) do
      post :search, to: "search#index"
    end
  end
  
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
