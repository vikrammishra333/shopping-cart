ShoppingCart::Application.routes.draw do
  
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :sessions, :only => [:new, :create, :destroy]

  resources :microposts

  resources :users

  resources :products

  resources :categories
  
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  match '/contact', :to => 'pages#contact'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/signup', :to => 'users#new'
  match '/show_cart', :to => 'pages#show_cart'
  match '/pages/add_to_cart/:id', :to => 'pages#add_to_cart'
  match '/empty_cart', :to => 'pages#empty_cart'
  match '/remove_from_cart/:id', :to => 'pages#remove_from_cart'
  match '/save_order', :to => 'pages#save_order'
  match '/checkout', :to => 'pages#checkout'
  root :to => 'categories#home'

  match 'products/:id.pdf', :to => 'products#show', :defaults => {:format => 'pdf'}
  match '/products.pdf', :to => 'products#index', :defaults => {:format => 'pdf'}
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
 
end
