class BusinessUpdateChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'business_update'
	end
end
