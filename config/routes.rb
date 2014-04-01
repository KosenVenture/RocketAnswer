KaitouShare::Application.routes.draw do

  resources :answer_files

  resources :schools do
    resources :departments
  end

  resources :subjects do
    resources :answers
  end

  namespace :admin do
    root 'dashboard#top'
  end
end
