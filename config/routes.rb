Rails.application.routes.draw do
  devise_for :users

  get 'illnesses/category'
  root 'illnesses#index'
  get 'quizzes/check_answer'
  get 'quizzes/show'
  get 'quizzes/reset_game'
  get 'quizzes/summary'

  authenticate :user do
    resources :illnesses, only: [:new, :create, :edit, :update, :category, :destroy]
    resources :cases
    get "/differentials/create", to: "differentials#create"
    get "/differentials/destroy", to: "differentials#destroy"
  end

  resources :illnesses, only: [:index, :category, :show]
end
