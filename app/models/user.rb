class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :name, presence: true
  validates :role, presence: true

  # scopes
  scope :by_created_at, -> { order("created_at DESC") }

  # update users in real time
  after_create_commit { UserCreateBroadcastJob.perform_now self }
  after_update_commit { UserUpdateBroadcastJob.perform_now self }
  after_destroy_commit { UserDestroyBroadcastJob.perform_now self }

  def is_admin?
  	user = self
  	return user.role == "admin"
  end
end
