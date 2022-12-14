class Menu < ApplicationRecord

  belongs_to :cafe

  has_one_attached :image

  validates :menu_name, presence: true



  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
       image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end



end
