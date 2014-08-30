Rails.application.routes.draw do
  root to: 'analyses#new'
  resources :analyses, except: [:index]
end
