Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get   '/admin'        => 'admin#index'
  # get   '/admin/reload' => 'admin#reload'
  # patch '/admin/update' => 'admin#update_settings'

  devise_for :people
  as :person do
    get 'people/edit' => 'devise/registrations#edit',   :as => 'edit_person_registration'
    put 'people'      => 'devise/registrations#update', :as => 'person_registration'
  end
  
  root to: redirect('board/bahamut')
  get '/board'               => 'board#index'
  get '/board/:project_id/:team'         => 'board#index'
  get '/board/stories/:project_id/:team' => 'board#stories'
  get '/chart/:project_id/:team'         => 'chart#index'
  get '/list/:project_id/:team'          => 'list#index'

  get '/lite/:team'         => 'board#lite'
end