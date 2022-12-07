Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'home#index'

  get '/' => 'home#index', as: 'home'

  get '/categories' => 'categories#index', as: 'categories'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories' => 'categories#create', as: 'create_category'
  get '/categories/:id' => 'categories#show', as: 'category'
  get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  patch '/categories/:id' => 'categories#update', as: 'update_category'
  delete '/categories/:id' => 'categories#destroy', as: 'delete_category'  

  get '/categories/:category_id/tasks(.:format)' => 'tasks#index', as: 'category_tasks'
  get '/categories/:category_id/tasks(.:format)/new' => 'tasks#new', as: 'new_category_task'
  post '/categories/:category_id/tasks(.:format)' => 'tasks#create', as: 'create_category_task'
  get '/categories/:category_id/tasks/:id(.:format)' => 'tasks#show', as: 'category_task' 
  get '/categories/:category_id/tasks/:id/edit(.:format)' => 'tasks#edit', as: 'edit_category_task'
  patch '/categories/:category_id/tasks/:id' => 'tasks#update', as: 'update_category_task'
  delete '/categories/:category_id/tasks/:id' => 'tasks#destroy', as: 'delete_category_task'

  resources :users do
    resources :categories do
      resources :tasks 
    end
  end
end

  # get '/users/sign_out' => 

  # 'user'
  # 'user/:id'
  # 'user/:new'
  # 'user/edit'

  # delete '/users/sign_out(.:format)' => 'users/sessions#destroy', as: 'destroy_user_session'
  # get '/resource/sign_up' => 'registrations#new', as: 'registration'
