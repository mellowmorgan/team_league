Rails.application.routes.draw do
  root to: 'teams#index'
  resources :teams do
    resources :players
    resources :games
  end
end
