class Cafe < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :menus, dependent: :destroy

                            #営業時間外　　　　空席あり　　　残りわずか　　　空席なし
   enum congestion_status: { outside_hours: 0, available: 1, little_left: 2, not_available: 3 }

  #緯度経度を取得する
  geocoded_by :address
  after_validation :geocode, if: :address_changed?



end
