class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies

  validates :user_type, presence: true, inclusion: { in: %w(employee manager admin) }

  def make_employee
    update(user_type: 'employee')
  end

  def make_manager
    update(user_type: 'manager')
  end

  def make_admin
    update(user_type: 'admin')
  end
end
