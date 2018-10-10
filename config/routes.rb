Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lamdba, only: %i[index create new show]
  post '/welcome', to: 'lamdba#welcome'
  root to: 'lamdba#new'
end
