class Company < ApplicationRecord
  belongs_to :user
  has_one :social

  validates :name, presence: true
  validates :social_id, presence: true
  validates :user_id, presence: true
end
