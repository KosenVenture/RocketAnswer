KaitouShare::Application.routes.draw do
  root to: 'home#index'

  resources :universities do
    resources :departments
  end

  resources :subjects do
    resources :answers, except: [:index] do
      resources :answer_files, only: [:create, :destroy]
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
