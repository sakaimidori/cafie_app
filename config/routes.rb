Rails.application.routes.draw do
  # 管理者側のルーティング設定

  # URL /cafes/sign_in ...
  devise_for :cafes, controllers: {
  registrations: "cafes/registrations",
  sessions: 'cafes/sessions'
  }

  #店舗TOPページ（店舗基本情報画面）
  get 'cafe' => 'cafes/homes#top'

  namespace :cafe do

    resources :cafes, only: [:edit, :update]
    resources :menus, only: [:new]

  end




  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
