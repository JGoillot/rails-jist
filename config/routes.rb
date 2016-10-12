Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  get "dashboard" , to: "pages#dashboard", as: "dashboard"
  get "research" , to: "journalists#research", as: "research"
  get "plan" , to: "plans#show", as: "plan"
  get "favorite-journalists" , to: "journalists#favorite", as: "favorite_journalists"
  post "export", to: "journalists#export", as: "export"
  resources :journalists, only: [:index, :show] do
    resources :personal_lists, only: [:create, :destroy]
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end
