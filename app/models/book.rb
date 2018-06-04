class Book < ApplicationRecord

  validates :title,  presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 100 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :number_page, presence: true, length: { minimum: 1 }, length: { maximum: 4 }
  validates :year, presence: true, length: { minimum: 4 }, length: { maximum: 4 }
  has_many :loans

end
