class BusinessesUpdateChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'businesses_update'
	end
end
