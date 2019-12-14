Rails.application.routes.draw do
  get 'images/:id', to: 'images#show'

  get 'assignments/', to: 'assignments#show'
  post 'assignments/assign', to: 'assignments#assign'
  post 'assignments/remove', to: 'assignments#remove'

  get 'driversandcars', to: 'filter#index'
  post 'filter/by-car', to: 'filter#car'
  post 'filter/by-driver', to: 'filter#driver'
  
  resources :drivers
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
