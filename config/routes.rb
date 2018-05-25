Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/db', as: 'rails_admin'
  get   '/admin'        => 'admin#index'
  get   '/admin/reload' => 'admin#reload'
  patch '/admin/update' => 'admin#update_settings'

  devise_for :people
  as :person do
    get 'people/edit' => 'devise/registrations#edit',   :as => 'edit_person_registration'
    put 'people'      => 'devise/registrations#update', :as => 'person_registration'
  end

  # board
  root to: 'board#home'
  get '/board/:account_path'         => 'board#index'
  get '/board/stories/:account_path' => 'board#stories'

  # merge requests
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'merge_requests/:account_path' => 'merge_requests#create'
    end
  end

  # kanban
  # get '/kanban'               => 'kanban#index'
  # get '/kanban/:team'         => 'kanban#index'
  # get '/kanban/stories/:team' => 'kanban#stories'

  # get '/chart/:project_id/:team' => 'chart#index'
  # get '/list/:project_id/:team'  => 'list#index'
  # get '/lite/:team'              => 'board#lite'
end
