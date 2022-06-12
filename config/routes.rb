Rails.application.routes.draw do
  root 'bus_lines#index'

  devise_for :admins

  authenticated :admin do
    root 'dashboard#show', as: :authenticated_root
  end

  namespace :admins do
    get 'dashboard', to: 'dashboard#show'
    resources :bus_lines
  end

  resources :bus_lines

  get 'about', to: 'pages#about'
end
