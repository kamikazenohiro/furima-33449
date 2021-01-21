Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    resources :items_buys, only: [:index, :create]
  end
end
