KaitouShare::Application.routes.draw do
  root to: 'home#index'

  devise_for :user,
    controllers: {
      registrations: 'user/registrations'
    }

  resources :universities, only: [:index, :show] do
    resources :departments, only: [:index, :show]
  end

  resources :answers, except: [:index] do
    resources :answer_files, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :update]
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
