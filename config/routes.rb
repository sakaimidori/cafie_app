Rails.application.routes.draw do

  root to: "homes#top"
  get 'about' => 'homes#about'


  # 管理者側のルーティング

  # URL /cafes/sign_in ...
  devise_for :cafe, controllers: {
  registrations: "cafe/registrations",
  sessions: 'cafe/sessions'
  }


  namespace :cafe do
    root to: "homes#top", as: '/'
    resource :cafes, only: [:edit, :update] do
      #退会確認画面
      get :confirm
      #退会（論理削除）
      patch :withdraw
    end
    resources :menus, only: [:index, :create, :index, :edit, :update, :destroy]

  end





  # ユーザー側のルーティング
  # URL /users/sign_in ...
  devise_for :user, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  namespace :user do
    resources :cafes, only: [:index, :show] do

    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
