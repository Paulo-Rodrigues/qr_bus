Rails.application.routes.draw do
  root 'bus_lines#index'

  devise_for :admins

  resources :bus_lines

  get 'about', to: 'pages#about'
end
