class Loan < ApplicationRecord
  belongs_to :student
  belongs_to :book
  validates :book_id, presence: true
  validates :student_id, presence: true
  default_scope -> { order(created_at: :desc) }
end
