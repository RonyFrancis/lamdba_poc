Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lamdba, only: %i[index create new show]
  require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
  post '/welcome', to: 'lamdba#welcome'
  post '/deliveroo', to: 'lamdba#welcome'
  root to: 'lamdba#new'
  post '/v1/orders/:order_id/sync_status',  to: 'lamdba#sync_status'
  get '/v1/orders/111/prep_stage', to: 'lamdba#prep_stage'
end
