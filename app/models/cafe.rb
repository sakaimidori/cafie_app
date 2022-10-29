class Cafe < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :menus, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many_attached :cafe_images

                            #営業時間外　　　　空席あり　　　残りわずか　　　空席なし
   enum congestion_status: { outside_hours: 0, available: 1, little_left: 2, not_available: 3 }

  #緯度経度を取得する
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #ユーザidがFavoritesテーブル内に存在するかを調べる
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
