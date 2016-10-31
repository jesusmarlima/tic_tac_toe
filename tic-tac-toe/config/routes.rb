Rails.application.routes.draw do
  resources :welcome, only: [:index]
  resources :users, only: [:new, :create, :show] do
    resources :games, only: [:index, :create, :show]
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'
end
