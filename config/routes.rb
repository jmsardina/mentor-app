Rails.application.routes.draw do
  resources :questions

  resources :lists

  # resources :users, path: "mentors", except: :index
  # resources :users, path: "students", except: :index

  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/:provider', :to => 'sessions#new'
  get '/logout', :to => 'sessions#destroy'

  get '/users/new' => 'users#new'
  post '/' => 'users#create'

  get '/mentors' => 'users#mentors_index'
  post '/mentors' => 'users#create'
  # get '/mentors/new' => 'users#new'
  get '/mentors/:id/edit' => 'users#edit', as: :mentor_edit
  patch '/mentors/:id' => 'users#update'
  put '/mentors/:id' => 'users#update'
  get '/mentors/:id' => 'users#show', as: :mentor

  root 'welcome#index'

  get '/students' => 'users#students_index'
  post '/students' => 'users#create'
  # get '/students/new' => 'users#new'
  get '/students/:id/edit' => 'users#edit', as: :student_edit
  patch '/students/:id' => 'users#update'
  put '/students/:id' => 'users#update'
  get '/students/:id' => 'users#show', as: :student

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # resources :users do
  #   :mentors
  # end
  # resources :users, as: 'mentors'



  # get '/users' => 'users#show'
  # get '/students/:id' => 'users#show'


  # get '/mentors/:id' => 'users#show', as: "mentor"
  # get '/students/:id' => 'users#show', as: "student"


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
