Rails.application.routes.draw do
  devise_for :people
  
  root to: redirect('board/bahamut')
  get '/board/:team'   => 'board#index'
  get '/chart/:team'   => 'chart#index'
  get '/pairing/:team' => 'pairing#index'
  get '/list/:team'    => 'list#index'
end