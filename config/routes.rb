Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard" , to: "pages#dashboard", as: "dashboard"
  get "research" , to: "journalists#research", as: "research"

  resources :journalists, only: [:index, :show] do
    resources :personal_lists, only: [:create, :destroy]
  end
end
