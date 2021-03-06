Rails.application.routes.draw do
  
  resources :product_views
  get '/product_show', to: 'product_views#create_product_view', as: :product_show
  resources :searches,only:[:index]
  resources :wishlists, only:[:index]
  get '/destroy_wishlisted_product' => 'wishlists#destroy_wishlisted_product', as: :destroy_wishlisted_product
  get '/add_to_wishlist' => 'wishlists#add_to_wishlist', as: :add_to_wishlist
  get '/remove_from_wishlist' => 'wishlists#remove_from_wishlist', as: :remove_from_wishlist
  resources :categories
  resources :notification_belongs
  get 'after_readed', action: :after_read, controller: 'notification_belongs'
  resources :notifications
  get 'carts/index',  to: 'carts#index'
  get 'carts/buy_now',  to: 'carts#buy_now'
  post 'carts/update_qty',  to: 'carts#update_qty'
  get 'carts/update_product_service', to: 'carts#update_product_service'
  get 'orders/time_slot', to: 'orders#time_slot'
  root 'static_pages#home'
  devise_for :users
  resources :users do
    member do
      post 'soft_destroy'
    end
  end
  resources :product_services do
    resources :orders, module: :product_services
    member do
      post 'soft_destroy'
    end
  end
  resources :products do
    resources :orders, module: :products
    member do
      post 'soft_destroy'
    end
  end
  
  resources :product_variants do
    resources :orders, module: :product_variants
    member do
      post 'soft_destroy'
    end
  end
  resources :orders do
    collection do
      get 'time_slot'
    end
  end
  get 'payment/create_payment', to: "payment#create_payment"
  get 'payment/payment_failed', to: "payment#payment_failed"
  get 'payment/order_place', to: "payment#order_place"
end
