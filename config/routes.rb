Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :companies
  resources :posts
  resources :careers

  delete '/posts/:id', to: 'posts#destroy', as: :delete_post
  get '/change_locale_to_en', to: 'application#change_locale_to_en', as: :change_locale_to_en
  get '/change_locale_to_uk', to: 'application#change_locale_to_uk', as: :change_locale_to_uk
end
