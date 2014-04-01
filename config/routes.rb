KaitouShare::Application.routes.draw do

  resources :subjects

  resources :schools do
    resources :departments
  end

  namespace :admin do
    root 'dashboard#top'
  end
end
