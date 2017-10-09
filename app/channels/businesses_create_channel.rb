class BusinessesCreateChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'businesses_create'
	end
end
