class BusinessesDestroyChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'businesses_destroy'
	end
end
