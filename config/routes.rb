Rails.application.routes.draw do

  scope '/api' do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'user/registrations'
    }
    
    resources :users, only: [:index, :update]
    get 'search-orders', to: 'orders#search'
    put 'return-order/:id', to: 'orders#return_order'
    post 'quote-price', to: 'orders#quote'
    resources :customers
    resources :products
    resources :orders
    resources :articles
    resources :stores
    resources :dashboards
    put 'articles/update', to: 'articles#update'
    resources :rates, only: [:index, :update]
    resources :product_discoutedrates, only: [:index, :update, :show]
    put 'rates/update', to: 'rates#update'
    get '/get_products', to: 'stores#get_products'
    get '/customers_in_debt', to: 'customers#get_in_debt'
  end
  # get '*path' => redirect('/')
end
