Paypal::Application.routes.draw do
  resources :users
  root :to => "groups#index"
  match '/createGroup', :to => "groups#createGroup" 
  match '/test_createGroup', :to => "groups#test" 
  match '/test_getGroup', :to => "groups#test_getGroup" 
  match '/getGroup', :to => "groups#getGroup" 
  match '/test_submitOrder', :to => "orders#test_submitOrder" 
  match '/submitOrder', :to => "orders#submitOrder" 
  match '/getAllOrders', :to => "orders#getAllOrders" 
  match '/test_getAllOrders', :to => "orders#test_getAllOrders" 
  match '/test_successfulPayments', :to => "orders#test_successfulPayments" 
  match '/successfulPayments', :to => "orders#successfulPayments" 
  match '/payback', :to => "orders#payback" 
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
  # match ':controller(/:action(/:id))(.:format)'
end
