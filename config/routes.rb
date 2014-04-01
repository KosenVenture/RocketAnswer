KaitouShare::Application.routes.draw do
  namespace :admin do
    root 'dashboard#top'
  end
end
