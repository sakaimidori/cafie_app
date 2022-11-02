class Review < ApplicationRecord

  belongs_to :user
  belongs_to :cafe

  validates :content, presence: true

end

