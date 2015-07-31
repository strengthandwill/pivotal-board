Rails.application.routes.draw do
  devise_for :people
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_person_registration'
    put 'users' => 'devise/registrations#update', :as => 'person_registration'
  end
  
  root to: redirect('board/bahamut')
  get '/board'         => 'board#index'
  get '/board/:team'   => 'board#index'
  get '/chart/:team'   => 'chart#index'
  get '/pairing/:team' => 'pairing#index'
  get '/list/:team'    => 'list#index'
end