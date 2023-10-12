class Position < ApplicationRecord
  enum status: { open: 'open', closed: 'closed' }

  has_and_belongs_to_many :technologies
  has_many :candidates

  validates :title, presence: true, length: { minimum: 6 }
  validates :body, presence: true, length: { minimum: 15 }
end
