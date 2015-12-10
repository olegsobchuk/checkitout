Rails.application.routes.draw do
  root 'sessions#new'

  resource :session, only: [:new, :create, :destroy]
  resources :users, except: :index do
    resources :projects do
      resources :scenarios, except: :index
    end
  end
end
