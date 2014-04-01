KaitouShare::Application.routes.draw do
  resources :schools

  namespace :admin do
    root 'dashboard#top'
  end
end
