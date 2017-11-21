Rails.application.routes.draw do
  root to: 'admins#index'
  devise_for :admins
  mount WeixinRailsMiddleware::Engine, at: "/"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admins do
    member do
      get 'detail'
    end
  end
  resources :resumes
  resources :wei_xin

  resources :twitter_infos

end
