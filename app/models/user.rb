class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
  has_many :posts

  validates :user_type, presence: true, inclusion: { in: %w[employee manager admin regular] }

  def change_user_type(user_type)
    update(user_type:) if %w[employee manager admin regular].include?(user_type)
  end

  def admin?
    user_type == 'admin'
  end

  def manager?
    user_type == 'manager'
  end

  def employee?
    user_type == 'employee'
  end

  def regular?
    user_type == 'regular'
  end
end
