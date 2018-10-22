Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lamdba, only: %i[index create new show]
  post '/welcome', to: 'lamdba#welcome'
  post '/deliveroo', to: 'lamdba#welcome'
  root to: 'lamdba#new'
  post '/v1/orders/:order_id/sync_status',  to: 'lamdba#sync_status'
  post '/v1/orders/:order_id/prep_stage', to: 'lamdba#prep_stage'
end
