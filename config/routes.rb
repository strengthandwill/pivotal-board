Rails.application.routes.draw do
  root  'board#index'
  get '/board/:team' => 'board#index'
end