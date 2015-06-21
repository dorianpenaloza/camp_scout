Rails.application.routes.draw do

  root 'camps#index'

  resources :camps
  resources :compares
  post "/compare/drop" => "compares#drop"
  get "/search" => "camps#search"



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # Redirect to the compare page
  # get '/compare' => "compare#index"
  # Adds the ID of the camp you want to compare to `session[:cart]`
  # post "/camps/compare/:id" => "camps#add_to_compare"
  # post "/remove_from_cart/:id" => "camps#remove_from_cart", as: "remove_from_cart"
  
  # Example of regular route:
  # get "show" => "camps#show"
   # get "application" => "camps#show"
  

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
