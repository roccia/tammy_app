Rails.application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources  :resumes
  resources  :wei_xin
 end
