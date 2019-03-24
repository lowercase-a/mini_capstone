Rails.application.routes.draw do


  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  namespace :api do
    get "/products" => 'products#index'
    post "/products" => 'products#create'
    get "/products/:id" => 'products#show'
    patch "/products/:id" => 'products#update'
    delete "/products/:id" => 'products#destroy'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'
    get '/orders/:id' => 'orders#show'

    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'
    delete '/carted_products/:id' => 'carted_products#destroy'
  end
end
