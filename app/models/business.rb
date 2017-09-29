class Business < ApplicationRecord
	# validations
  validates :mercury_business_id, presence: true
  validates :name, presence: true
  validates :thumbnail, presence: true
  validates :email, presence: true
  validates_email_format_of :email
  validates :phone, presence: true, phone: { possible: true }
  validates :address, presence: true
  validates :longitude, presence: true, numericality: true
  validates :latitude, presence: true, numericality: true
  validates :description, presence: true
end