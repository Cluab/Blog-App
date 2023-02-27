Rails.application.routes.draw do
  get 'users/index'
  get 'users/:id', to: 'users#show', as: 'user'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
end
