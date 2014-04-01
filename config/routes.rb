KaitouShare::Application.routes.draw do

  resources :answer_files

  resources :schools do
    resources :departments
  end

  #resources :subjects, except: [:index] do
  #  resources :answers
  #end

  namespace :admin do
    root 'dashboard#top'

    resources :subjects do
      resources :answers
    end
  end
end
