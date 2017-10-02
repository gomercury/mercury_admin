class BusinessService
	def self.create(options = {})
		url = Rails.application.secrets.business_url + "/api/v1/businesses"

		HTTParty.post(
			url,
			query: {
				business: options,
			},
		)
	end

	def self.update(business, options = {})
 		url = Rails.application.secrets.business_url + "/api/v1/businesses/" + business.mercury_business_id.to_s
 		token = business.api_keys.first.access_token

 		HTTParty.put(
 			url,
 			headers: {
	 			"Authorization": "Token token=\"#{token}\"",
	 		},
 			query: { 
 				business: options,
 			},
 		)
	end

	def self.destroy(business)
		url = Rails.application.secrets.business_url + "/api/v1/businesses/" + business.mercury_business_id.to_s
		token = business.api_keys.first.access_token

		HTTParty.delete(
			url,
			headers: {
	 			"Authorization": "Token token=\"#{token}\"",
	 		},
		)
	end
end
