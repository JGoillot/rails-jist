Rails.application.routes.draw do
  get 'personal_lists/create'

  get 'personal_lists/destroy'

  get 'journalists/index'

  get 'journalists/show'

  devise_for :users
  root to: 'pages#home'
  get "dashboard" , to: "pages#dashboard", as: "dashboard"

  resources :journalists, only: [:index, :show]
  resources :personal_lists, only: [:create, :destroy]

end
