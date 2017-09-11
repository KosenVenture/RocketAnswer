Rails.application.routes.draw do
  get 'ranking', to: 'ranking#index'

  root to: 'home#index'

  get 'aboutus', to: 'home#aboutus'
  get 'campaign', to: 'home#campaign'

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

    member do
      post 'stock'
    end
  end

# 体験談用のルート
  resources :exp_stories, except: [:index] do
    collection do
      # 学科取得用ルート
      get 'get_depts'
    end
  end

  resources :answer_stocks

  resource :contact, only: [:show, :create]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
