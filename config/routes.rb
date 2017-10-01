Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'

  resources :customers
  resources :products
  resources :orders, expect: :update
  resources :articles
  resources :stores
  resources :dashboards
  put 'articles/update', to: 'articles#update'
  resources :rates
  put 'rates/update', to: 'rates#update'
  get '/get_products', to: 'stores#get_products'
end
