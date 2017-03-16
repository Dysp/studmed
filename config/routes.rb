Rails.application.routes.draw do
  get 'categorizations/create'

  get 'categorizations/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'illnesses#index'
  resources :illnesses
  resources :differentials
end
