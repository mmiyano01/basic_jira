Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
	root 'task_list#show'

  get 'task/new' => 'task#new'
  post 'task/create' => 'task#create'
  post 'task/status_update' => 'task#status_update'
  post 'task/delete' => 'task#delete'
  get 'task_list/show_subtask/:id(.:format)' => 'task_list#show_subtask' , as: :get_show_subtask
  post 'task_list/show_subtask/:id(.:format)' => 'task_list#show_subtask', as: :post_show_subtask
  get 'subtask/new' => 'subtask#new'
  post 'subtask/create' => 'subtask#create'
  post 'subtask/status_update' => 'subtask#status_update'
  post 'subtask/delete' => 'subtask#delete'

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
