Rails.application.routes.draw do

  resources :users, only: [:index, :new, :show] do
    resources :games
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'users#index'
end
