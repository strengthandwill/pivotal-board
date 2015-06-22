Rails.application.routes.draw do
  root  'stories#index'
  get ':team' => 'stories#index'
end
