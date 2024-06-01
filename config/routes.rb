Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :destroy, :edit, :show, :update] do
    resources :informations, only: [:index, :create]
  end
  resources :users, only: :show
end
