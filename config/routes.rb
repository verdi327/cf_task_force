Rails.application.routes.draw do
  
  scope :module => 'buttercms' do
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/blog/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/blog/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/blog/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '/blog(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/blog/:slug' => 'posts#show', :as => :buttercms_post
  end

  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  resources :services do 
    collection do
      get "personal-training"
      get "crossfit-classes"
      get "individual-design"
      get "nutrition-planning"
      get "crossfit-academy"
      get "inbody-scan"
      get "specialty-courses"
    end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get '/workouts'           => 'pages#workouts'
  get '/schedule'      => 'pages#schedule'
  get '/contact-us'    => 'pages#contact_us'
  get '/shit-we-like'  => 'pages#shit_we_like'
  get '/refer-a-friend'=> 'pages#refer_a_friend'
  get '/ebook-library' => 'pages#ebook_library'
  get '/get-started'   => 'pages#get_started'
  get '/thank-you'     => 'pages#thank_you'
  get '/faqs'          => 'pages#faqs'
  get '/book-your-no-sweat-intro' => "pages#book_your_no_sweat_intro"
  get '/pricing' => "pages#pricing"
  get 'six-week-crossfit-challenge' => 'pages#six_week_crossfit_challenge'
  get 'men-only-6-week-challenge' => 'pages#challenge_male'
  get 'drop-in'        => 'pages#drop_in'
  get '/sitemap'       => 'pages#sitemap'
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  get '/goal-review-session' => 'pages#goal_review_session'
  get 'nutrition-challenge' => 'pages#nutrition_challenge'

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
