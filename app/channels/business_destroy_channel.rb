class BusinessDestroyChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'business_destroy'
	end
end
