Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :blogs, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:edit, :update]
end
