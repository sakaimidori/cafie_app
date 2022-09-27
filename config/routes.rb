Rails.application.routes.draw do

  # 管理者側のルーティング設定

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
    resources :menus, only: [:new, :index]

  end




  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
