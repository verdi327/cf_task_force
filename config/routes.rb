Rails.application.routes.draw do
  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  namespace :admin do 
    resources :coaches do 
      resources :images, :only => [:create, :destroy]
    end
    resources :wods
    resources :messages, only: [:index, :create, :new, :show]
  end

  namespace :tools do 
    resources :wendlers, only: [:index, :create] do 
      collection do 
        get "results"
      end
    end
  end

  resources :leads, only: [:create]
  
  mount Buttercms::Engine => '/blog'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get '/wod'           => 'pages#wod'
  get '/schedule'      => 'pages#schedule'
  get '/contact-us'    => 'pages#contact_us'
  get '/admin'         => 'admin/base#index'
  get '/shit-we-like'  => 'pages#shit_we_like'
  # get '/wod_loader'    => 'wod_loader#fetch'
  get '/get-started'   => 'pages#get_started'
  get '/sitemap'       => 'pages#sitemap'
  get '/grand-opening' => 'pages#grand_opening'
  post '/opening_reminder' => 'opening_reminder#create'
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  get '/fdhq-callback' => 'admin/messages#index'
  get '/tools' => 'tools/base#index'

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
