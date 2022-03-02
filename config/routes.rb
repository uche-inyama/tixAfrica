Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resource :like, only: [:create, :destroy]
  end

  authenticated do
    root to: "events#index", as: :authenticated_root
  end

  root to: "home#index"
end
