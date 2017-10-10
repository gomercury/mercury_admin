class BusinessCreateChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'business_create'
	end
end
