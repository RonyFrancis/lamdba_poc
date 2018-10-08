Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lamdba, only: [:index, :create, :new, :show]
  root to: "lamdba#new"

end
