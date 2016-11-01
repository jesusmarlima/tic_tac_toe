Rails.application.routes.draw do
  resources :welcome, only: [:index]
  resources :users, only: [:new, :create, :show] do
    resources :games, only: [:index, :create, :show]
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'

  post 'games/computer_move/:id', to: 'games#get_computer_move', as: 'computer_move'
  post 'games/save/:id', to: 'games#save', as: 'save_game'


end
