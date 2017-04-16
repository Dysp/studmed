Rails.application.routes.draw do
  devise_for :users
  get 'categorizations/create'
  get 'categorizations/destroy'
  get 'illnesses/category'
  root 'illnesses#index'
  get 'quizzes/check_answer'
  get 'quizzes/show'
  get 'quizzes/reset_game'
  get 'quizzes/summary'

  authenticate :user do
    resources :illnesses, only: [:new, :create, :edit, :update, :category, :destroy]
    resources :cases
  end

  get "/differentials/create", to: "differentials#create"
  get "/differentials/destroy", to: "differentials#destroy"
  resources :illnesses, only: [:index, :category, :show]
end
