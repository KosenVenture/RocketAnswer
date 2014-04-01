KaitouShare::Application.routes.draw do

  resources :schools do
    resources :departments
  end

  namespace :admin do
    root 'dashboard#top'
  end
end
