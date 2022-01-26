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
      post 'restore_soft_deleted'
    end
  end
  resources :product_services do
    resources :orders, module: :product_services
    member do
      post 'soft_destroy'
      post 'restore_soft_deleted'
    end
  end
  resources :products do
    resources :orders, module: :products
    member do
      post 'soft_destroy'
      post 'restore_soft_deleted'
    end
  end
  
  resources :product_variants do
    resources :orders, module: :product_variants
    member do
      post 'soft_destroy'
      post 'restore_soft_deleted'
    end
  end
  resources :orders do
    collection do
      get 'time_slot'
    end
  end
  resources :static_pages do
    collection do
      get 'sales_graph_data'
      get 'sales_tabular_data'
      get 'users_graph_data'
      get 'sales_analytical_data_pdf'
    end
  end
  get 'payment/create_payment', to: "payment#create_payment"
  get 'payment/payment_failed', to: "payment#payment_failed"
  get 'payment/order_place', to: "payment#order_place"
end
