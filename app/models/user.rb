class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies

  validates :user_type, presence: true, inclusion: { in: %w[employee manager admin regular] }

  def change_user_type(user_type)
    update(user_type:) if %w[employee manager admin regular].include?(user_type)
  end
end
