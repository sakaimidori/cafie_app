Rails.application.routes.draw do
  # 店舗用

  # URL /cafes/sign_in ...
  devise_for :cafes, controllers: {
  registrations: "cafes/registrations",
  sessions: 'cafes/sessions'
  }

  #店舗TOPページ（店舗基本情報画面）
  get 'cafes' => 'cafes/homes#top'


  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
