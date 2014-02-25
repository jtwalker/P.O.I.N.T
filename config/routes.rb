Point::Application.routes.draw do
  
  resources :pictures

  #Authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  #Users
  resources :users
  resources :account_change_requests, :only => [:new, :create]

  #POIs and Comements
  resources :point_of_interests, :shallow => true do
    resources :comments
    resources :pictures
  end

  #POI directions
  resources :point_of_interests do
    member do
      get :directions
    end
  end

  #Picture
  resources :pictures do
    member do
      post :make_main_image
      get :make_main_image
    end
  end

  #admin
  get 'admin/index'
  get 'admin' => redirect("admin/index")
  get 'admin/accept_account_change_request'
  get 'admin/deny_account_change_request'
  get 'admin/accept_pending_picture_upload'
  get 'admin/deny_pending_picture_upload'

  #main
  get "main/home"
  get "main/rules"
  get "main/underconstruction"
  
  #Contact us
  resources :contact_us_messages, :only => [:new, :create]
  get "contact_us_messages/confirmation"
  get "/contact_us_messages" => redirect("/contact_us_messages/new")
  
  root "main#home"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
