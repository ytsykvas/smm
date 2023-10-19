Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :companies
  resources :posts
  resources :positions
  resources :candidates, only: [:create, :show]

  delete '/posts/:id', to: 'posts#destroy', as: :delete_post
  get 'positions/:id/candidates/new_candidate', to: 'candidates#new_candidate', as: :new_candidate
  get 'positions/:id/candidates', to: 'candidates#candidates', as: :all_candidates
  get 'positions/:id/candidates/export_pdf', to: 'candidates#export_pdf', as: :export_pdf_candidates
  get 'positions/:id/candidates/export_excel', to: 'candidates#export_excel', as: :export_excel_candidates
  get '/positions/:id/close_position', to: 'positions#close_position', as: :close_position

  get '/change_locale_to_en', to: 'application#change_locale_to_en', as: :change_locale_to_en
  get '/change_locale_to_uk', to: 'application#change_locale_to_uk', as: :change_locale_to_uk
end
