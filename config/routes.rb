Rails.application.routes.draw do
  get 'chart/index'

  root to: redirect('board/bahamut')
  get '/board/:team' => 'board#index'
  get '/chart/:team' => 'chart#index'
  get '/list/:team'  => 'list#index'
end