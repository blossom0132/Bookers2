Rails.application.routes.draw do

  get 'homes/index'
  # get 'homes/about'
  get 'home/about' => 'homes#about'
  root to: 'homes#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index]
  # resources :homes, only: [:show, :index]

  

end
