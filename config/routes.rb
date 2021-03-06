Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :spots do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
end
