Rails.application.routes.draw do
  root 'sessions#new'

  resource :session, only: [:new, :create, :destroy]
  resources :users, except: :index
  resources :projects do
    get :scenarios, to: 'scenarios#edit'
    put :scenarios, to: 'scenarios#update'
    delete :scenarios, to: 'scenarios#destroy'
  end
end
