class Candidate < ApplicationRecord
  belongs_to :position

  validates :name, length: { minimum: 3 }
  validates :email,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Check email format" }
  validates :phone, length: { in: 10..13, message: "Should have 10-13 numbers" }

  def remotely?
    remotely == true
  end
end
