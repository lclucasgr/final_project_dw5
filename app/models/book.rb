class Book < ApplicationRecord

  validates :title,  presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 100 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :number_page, presence: true, length: { minimum: 1, maximum: 4 }
  validates :year, presence: true, length: { maximum: 4, minimum: 4 }
  has_many :loans,  dependent: :destroy
  has_many :devolutions
  mount_uploader :picture, PictureUploader

end
