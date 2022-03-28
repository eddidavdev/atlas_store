Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    resources :discounts
    get 'admin', to: 'admin#index'
    get 'admin/brands'
    get 'admin/products'
    get 'admin/discounts'
    get 'admin/orders'
    get 'admin/users'
    get 'admin/profiles'
  end

  resources :order_items
  resources :orders
  resources :profiles
  resources :brands do
    resources :products
  end
  resources :products
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
  get 'about', to: 'pages#about'
  get 'products', to: 'products#index'
  get 'shopping-cart', to: 'orders#current'
  get 'add_to_cart', to: 'orders#add_to_cart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
end