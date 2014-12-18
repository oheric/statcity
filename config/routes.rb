Rails.application.routes.draw do

  root 'gamelogs#index'
  
  get 'gamelogs/show' => 'gamelogs#show', as: :show

  get 'gamelogs/playerlog' => 'gamelogs#playerlog', as: :playerlog

  get 'gamelogs/playerusage' => 'gamelogs#playerusage', as: :playerusage

  get 'gamelogs/pace' => 'gamelogs#pace', as: :pace

  get 'gamelogs/playerlist' => 'gamelogs#playerlist', as: :playerlist

  get 'gamelogs/load' 

  get 'teams/' => 'teams#index', as: :teams

  get 'teams/new' => 'teams#new', as: :teamsnew

  post 'teams/' => 'teams#create', as: :teams_create

  get 'teams/show' => 'teams#show', as: :showteam

  post 'teams/new_player' => 'teams#new_player', as: :newplayer

  delete 'teams/:id' => 'teams#destroy', as: :team

  
  get 'positions/' => 'positions#index', as: :positions

  get 'positions/new' => 'positions#new', as: :positionsnew

  post 'positions/' => 'positions#create', as: :positions_create

  delete 'positions/:id' => 'positions#destroy', as: :position

  
  get 'players' => 'players#index', as: :players

  get 'players/new' => 'players#new', as: :playersnew

  post 'players/' => 'players#create', as: :players_create 

  delete 'players/:id' => 'players#destroy', as: :player

 
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
