class Loan < ApplicationRecord
  belongs_to :student
  belongs_to :book
  default_scope -> { order(created_at: :desc) }
end
