Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resource :like, only: [:create, :destroy]
  end
  authenticated do
    root to: "events#index", as: :authenticated_root
  end
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  root to: "home#index"
end
