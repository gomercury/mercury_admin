class ApiKey < ApplicationRecord
	# validations
	validates :access_token, presence: true
	validates :business_id, presence: true, numericality: true

	# relationships
	belongs_to :business
end
