Rails.application.routes.draw do
  resources :camps
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'camps#index'

  get '/compare' => "camps#compare"
  post "/camps/compare/:id" => "camps#add_to_compare"

  # Example of regular route:
  get "show" => "camps#show"
   # get "application" => "camps#show"
  get "/search" => "camps#search"


      # Add the ID of the camp you want to compare to `session[:cart]`
      # Redirect to the compare page

  #map.connect ":controller/:action/:id"
  #match 'camps/:id', :controller => 'camps', :action => 'compare'
  #match 'camps/:id', :to => 'camps#compare'
  #post 'camps/:id', :to => 'camps#compare'
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
