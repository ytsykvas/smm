class Company < ApplicationRecord
  belongs_to :user
  belongs_to :social

  validates :name, presence: true
  validates :social_id, presence: true
end
