Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :posts do
    get 'likes', on: :collection
    resource :like, only: %i[create destroy]
  end
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]

  namespace :admin do
    root 'dashboards#index'
    resources :users, only: %i[index show edit update destroy]
    resources :posts, only: %I[index show edit update destroy]
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
  end
end
