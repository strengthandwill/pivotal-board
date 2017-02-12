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
  root to: redirect('board/1345356/bahamut')
  get '/board/:project_id'         => 'board#index'
  get '/board/stories/:project_id' => 'board#stories'

  # kanban
  get '/kanban'               => 'kanban#index'
  get '/kanban/:team'         => 'kanban#index'
  get '/kanban/stories/:team' => 'kanban#stories'
  
  
  get '/chart/:project_id/:team' => 'chart#index'
  get '/list/:project_id/:team'  => 'list#index'
  get '/lite/:team'              => 'board#lite'
end