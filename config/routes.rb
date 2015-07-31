Rails.application.routes.draw do
  get '/admin'        => 'admin#index'
  get '/admin/reload' => 'admin#reload'

  devise_for :people
  as :person do
    get 'people/edit' => 'devise/registrations#edit',   :as => 'edit_person_registration'
    put 'people'      => 'devise/registrations#update', :as => 'person_registration'
  end
  
  root to: redirect('board/bahamut')
  get '/board'         => 'board#index'
  get '/board/:team'   => 'board#index'
  get '/chart/:team'   => 'chart#index'
  get '/list/:team'    => 'list#index'
end