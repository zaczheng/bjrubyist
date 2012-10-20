Bjrubyist::Application.routes.draw do
  resources :projects

  resources :events
  resources :memberships, only: [:create, :destroy]


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users

  match "/people"   => "home#people", as: :people
  #match "/projects" => "home#projects", as: :projects
  match "/join-us"  => "home#join_us", as: :join_us
end
