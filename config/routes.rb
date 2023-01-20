Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"

  namespace :public do
    get "/about" =>"homes#about"
    get "/users/my_page" => "users#show"
    get "/users/information/edit" => "users#edit"
    patch "/users/information" => "users#update"
    get "/users/unsubscribe" => "users#unsubscribe"
    patch "/users/withdraw" => "users#withdraw"
    resources :posts, only: [:new, :create, :index, :show] do
      resources :favorites, only: [:index]
      resource :favorites, only: [:create, :destroy]
    end
    resources :comments, only: [:create, :show, :destroy]
  end

  namespace :admin do
    root "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:show]
    resources :comments, only: [:show, :destroy]
  end

end
