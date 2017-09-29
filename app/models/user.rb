class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :name, presence: true
  validates :role, presence: true

  def is_admin?
  	user = self
  	return user.role == "admin"
  end
end
