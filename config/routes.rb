Rails.application.routes.draw do
  root  'stories#index'
  get '/chart/:team' => 'stories#chart'
  get '/board/:team' => 'stories#index'
end
