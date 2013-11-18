Csc667867TeamYak::Application.routes.draw do

  root to: 'welcome#index', :as => 'welcome'
  get "/yourcart" => "shoppingcartitems#yourcart"
  get "/account" => 'account#index'
  get "/search/(:page)" => 'results#search'
  get "/category/:cat/(:page)" => 'results#category'
  get "/about" => "welcome#about"
  get "/contact" => "welcome#contact"
  get "/faq" => "welcome#faq"
  get "/admin" => "admin#index"
  get "/yourshop" => "sellers#yourshop"
  get "/openshop" => "sellers#openshop"
  get "/edityourshop" => "sellers#edityourshop"
  get "/admin/users" => "admin#listusers"

# 7 resources: index, show, new, create, edit, update, destroy
  devise_for :users  
  resources :artworks
  resources :arttags
  resources :shoppingcartitems
  #resources :ordereditems
  
  # nested resources
  resources :orders do
    resources :ordereditems 
  end
  
  # namespaced resources
  namespace :admin do
    resources :orders do
      resources :ordereditems
    end
    resources :artworks
    resources :shoppingcartitems
    resources :sellers
    resources :reviews
  end
  
  
 
 



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
