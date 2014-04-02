KaitouShare::Application.routes.draw do

  resources :schools do
    resources :departments
  end

  resources :subjects do
    resources :answers, except: [:index] do
      resources :answer_files, only: [:create, :destroy]
    end
  end

  namespace :admin do
    root 'dashboard#top'
  end
end
