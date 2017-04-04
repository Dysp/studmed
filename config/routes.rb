Rails.application.routes.draw do
  devise_for :users
  get 'categorizations/create'
  get 'categorizations/destroy'
  get 'illnesses/category'

  root 'illnesses#index'

  authenticate :user do
    resources :illnesses, only: [:new, :create, :edit, :update, :destroy]
    resources :differentials
  end

  resources :illnesses, only: [:index, :show]
end
