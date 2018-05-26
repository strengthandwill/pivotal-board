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
end
