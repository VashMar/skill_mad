Skillmad::Application.routes.draw do
  
 

  resources :users
  resources :categories
  resources :leaderboards
  resources :sessions, :only => [:new, :create, :destroy, :verify, :activate_account]
  resources :videos do
   new do
    post :upload
    get :save_video
   end
  end
  resources :password_resets

  root :to => "users#index"
  
  match '/request_leaderboard', :to => 'application#request_leaderboard'
  match '/contact_email', :to => 'application#contact_email'
  match '/results', :to => 'search#show'
  match '/business_email', :to => 'business#business_email'
  match '/business_page', :to => 'business#show'
  match '/signup',  :to => 'users#create'
  match '/home', :to => 'users#index'
  match '/check_email', :to => 'users#check_email'
  match '/check_name',  :to =>  'users#check_name'
  match '/user_update', :to => 'users#update'
  match '/prof_update', :to => 'users#prof_update'
  match '/select_user', :to => 'users#select_user'
  match '/add_vote', :to => 'votes#add_vote'
  match '/remove_vote', :to => 'votes#remove_vote'
  match '/verify', :to =>'sessions#verify'
  match '/activate_account/:token', :to => 'sessions#activate_account', :as => :activate_account
  match '/destroy', :to => 'sessions#destroy'
  match '/upload', :to => 'videos#upload'
  match '/save', :to => 'videos#save_video'
  match '/vid_swap', :to => 'videos#vid_swap'
  match '/vid_bank', :to => 'videos#vid_bank'
  match '/submitted', :to => 'videos#submitted'
  match '/delete_video', :to => 'videos#destroy'
  match '/flush_junk' , :to => 'videos#flush_junk'
  match '/category_swap', :to => 'categories#swap'
  match '/video_board',  :to => 'leaderboards#video_board'
  match '/people_board', :to => 'leaderboards#people_board'	
  match '/category_boards', :to => 'categories#leaderboards'
  match '/t', :to =>  'users#index', :u => false 
  match '/u', :to =>  'users#index', :u => true
  match '/l', :to =>  'users#index', :l => true 
  match '/flag', :to => 'flags#flag'
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
