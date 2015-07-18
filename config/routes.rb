Rails.application.routes.draw do
  root to: redirect('board/bahamut')
  get '/board/:team'   => 'board#index'
  get '/chart/:team'   => 'chart#index'
  get '/pairing/:team' => 'pairing#index'
  get '/list/:team'    => 'list#index'
  
  devise_for :people
end