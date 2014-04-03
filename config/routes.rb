KaitouShare::Application.routes.draw do
  root to: 'home#index'

  devise_for :user,
    controllers: {
      registrations: 'user/registrations'
    }

  resources :universities, only: [:index, :show] do
    resources :departments, only: [:show]
  end

  resources :subjects, except: [:index] do
    resources :answers, except: [:index] do
      resources :answer_files, only: [:create, :destroy]
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
