Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords],  controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  # items
  
  resources :items, only: [:index, :show], module: 'public'
  
  # customers
  get 'customers/my_page' => "public/customers#show", as: "my_page"
  get 'customers/information/edit' => "public/customers#edit", as: "information_edit"
  patch 'customers/information' => "public/customers#udate"
  get  'customers/confirm' => "public/customers#confirm", as: "customers_confirm"
  patch '/customers/disable' => "public/customers#disable", as: "disable"
  
  # cart_items
 
  resources :cart_items, only: [:index, :update, :destroy, :create], module: 'public'
  
  delete '/cart_items' => "public/cart_items#destroy_all"
  
  # oders
  
  resources :orders, only: [:show, :index, :new], module: 'public'
  
  post 'orders/confirm' => "public/orders#confirm"
  post 'orders/decision' => "public/orders#decision"
  get 'orders/complete' => "public/orders#complete", as: "complete"
  
  # adresses

  resources :adresses, only: [:edit, :index, :create, :update, :destroy], module: 'public'

  
  namespace :admin do
    resources :orders, only: [:update, :show]
    
  end
  namespace :admin do
    resources :customers, only: [:update, :show, :index, :edit]
  end
  namespace :admin do
    resources :genres, only: [:update, :create, :index, :edit]
  end
  namespace :admin do
     resources :items, only: [:index,:edit, :show , :update, :create, :new,]
    
  end
  namespace :admin do
    get '/' => 'homes#top'
    
  end
  
  namespace :admin do
    resources :order_details, only: [:update]
    
  end
  
  root to: "public/homes#top"
  get '/about' => "public/homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
