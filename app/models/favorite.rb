class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :cafe

  #ユーザidがFavoritesテーブル内に存在するかを調べる
  #def self.favorited_by?(user)
    #exists?(user_id: user.id)
  #end
end
