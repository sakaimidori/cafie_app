Rails.application.routes.draw do

  #アプリケーショントップページ
  root to: "homes#top"
  #アプリケーションAboutページ
  get 'about' => 'homes#about'


  # 管理者側のルーティング


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

  devise_for :user, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  scope module: :user do
    resources :cafes, only: [:index, :show]do
      resources :reviews, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resource :users, only: [:show, :edit]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
