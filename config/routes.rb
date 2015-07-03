Rails.application.routes.draw do
  root  'stories#index'
  get '/board/:team' => 'stories#index'
end