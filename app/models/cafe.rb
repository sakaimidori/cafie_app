class Cafe < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #緯度経度を取得する
  before_validation :set_latlong

  has_many :menus, dependent: :destroy

  private

  def set_latlong
    # Google Map APIを使用して住所から緯度経度を取得する。
    self.latitude = 0
    self.longitude = 0
  end
end
