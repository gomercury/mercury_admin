class BusinessService
	def self.update(options = {})
		mercury_business_id = Business.first.mercury_business_id.to_s
 		url = Rails.application.secrets.business_url + "/api/v1/businesses/" + mercury_business_id
 		token = Rails.application.secrets.business_access_token

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
end
