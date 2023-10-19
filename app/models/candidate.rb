class Candidate < ApplicationRecord
  belongs_to :position

  validates :name, length: { minimum: 3 }
  validates :email,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "невірний формат електронної пошти" }
  validates :phone, format: { with: /\A(\+380)?\d{9}\z|\A0\d{9}\z/, message: "невірний формат номеру" }

  def self.per_page
    per_page = 5
  end

  def remotely?
    remotely == true
  end
end
