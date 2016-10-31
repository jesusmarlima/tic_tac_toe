Rails.application.routes.draw do
  resources :users, only: [:index, :new, :show] do
    resources :games
  end
end
