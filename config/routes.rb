Bjrubyist::Application.routes.draw do
  resources :events

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  match "/people"   => "home#people", as: :people
  match "/projects" => "home#projects", as: :projects
  match "/join-us"  => "home#join_us", as: :join_us
end