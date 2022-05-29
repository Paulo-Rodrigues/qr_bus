Rails.application.routes.draw do
  root 'bus_lines#index'

  resources :bus_lines

  get 'about', to: 'pages#about'
end
