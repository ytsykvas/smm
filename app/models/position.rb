class Position < ApplicationRecord
  enum status: { open: 'open', closed: 'closed' }

  has_and_belongs_to_many :technologies

  validates :title, presence: true
  validates :body, presence: true
end
